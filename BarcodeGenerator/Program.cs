using System.Text;
using System.Text.Json;
using NanoidDotNet;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.PixelFormats;
using YamlDotNet.RepresentationModel;
using ZXing;
using ZXing.Common;
using ZXing.Rendering;

Console.WriteLine("Starting Barcode and FHIR Example Generator...");

var barcodeOutputDir = "Barcodes";
var barcodeImageDir = "input/images/barcodes";  // For IG Publisher
var fshOutputDir = "input/fsh/examples/generated";
var sushiConfigPath = "sushi-config.yaml";

// Clean and create output directories
if (Directory.Exists(barcodeOutputDir))
    Directory.Delete(barcodeOutputDir, true);
Directory.CreateDirectory(barcodeOutputDir);

if (Directory.Exists(barcodeImageDir))
    Directory.Delete(barcodeImageDir, true);
Directory.CreateDirectory(barcodeImageDir);

if (Directory.Exists(fshOutputDir))
    Directory.Delete(fshOutputDir, true);
Directory.CreateDirectory(fshOutputDir);

// Read input data
var text = File.ReadAllText("BarcodeInput.json");
var barcodes = JsonSerializer.Deserialize<BarcodeData[]>(text);
ArgumentNullException.ThrowIfNull(barcodes);

// Track generated resource IDs for sushi-config.yaml
var generatedResources = new List<string>();

// Setup barcode renderers
var svgRenderer = new SvgRenderer();
var pixelRenderer = new PixelDataRenderer();

var options = new EncodingOptions
{
    PureBarcode = true,
    Margin = 1,
    Height = 200,
    Width = 200
};
var writer = new BarcodeWriterGeneric
{
    Format = BarcodeFormat.DATA_MATRIX,
    Options = options
};

// Generate a consolidated FSH file for all medications
var medicationFsh = new StringBuilder();
medicationFsh.AppendLine("// Auto-generated Medication examples from BarcodeInput.json");
medicationFsh.AppendLine("// Do not edit manually - regenerate using BarcodeGenerator");
medicationFsh.AppendLine();

// Generate a consolidated FSH file for all inventory items
var inventoryFsh = new StringBuilder();
inventoryFsh.AppendLine("// Auto-generated InventoryItem examples from BarcodeInput.json");
inventoryFsh.AppendLine("// Do not edit manually - regenerate using BarcodeGenerator");
inventoryFsh.AppendLine();

foreach (var barcode in barcodes)
{
    Console.WriteLine($"Processing GTIN: {barcode.GTIN} ({barcode.MedicationName})...");

    // Create barcode output directories
    var barcodePath = Path.Combine(barcodeOutputDir, barcode.GTIN);
    var barcodeImagePath = Path.Combine(barcodeImageDir, barcode.GTIN);
    Directory.CreateDirectory(Path.Combine(barcodePath, "svg"));
    Directory.CreateDirectory(Path.Combine(barcodePath, "png"));
    Directory.CreateDirectory(barcodeImagePath);

    // Generate Medication FSH
    medicationFsh.AppendLine($"Instance: {barcode.HISCode}");
    medicationFsh.AppendLine($"InstanceOf: MedicationEAHP");
    medicationFsh.AppendLine($"Title: \"Generated - {barcode.MedicationName}\"");
    medicationFsh.AppendLine($"Description: \"Auto-generated Medication resource for {barcode.MedicationName} manufactured by {barcode.Manufacturer}. GTIN: {barcode.GTIN}\"");
    medicationFsh.AppendLine($"* code.text = \"{barcode.MedicationName}\"");
    medicationFsh.AppendLine($"* status = #active");
    medicationFsh.AppendLine();

    // Track medication resource
    generatedResources.Add($"Medication/{barcode.HISCode}");

    // Generate barcodes and inventory items
    for (int i = 0; i < barcode.No; i++)
    {
        var serialNumber = Nanoid.Generate(Nanoid.Alphabets.LettersAndDigits, 10);
        var expiryDate = DateOnly.Parse(barcode.ExpiryDate);
        var exp = expiryDate.ToString("yyMMdd");
        var rawScan = $"{(char)29}01{barcode.GTIN}10{barcode.BATCH}{(char)29}17{exp}21{serialNumber}";

        // Generate barcode images
        var matrix = writer.Encode(rawScan);

        var svg = svgRenderer.Render(matrix, BarcodeFormat.DATA_MATRIX, string.Empty);
        File.WriteAllText(Path.Combine(barcodePath, "svg", $"barcode{i}.svg"), svg.Content);

        var png = pixelRenderer.Render(matrix, BarcodeFormat.DATA_MATRIX, string.Empty);
        using var image = Image.LoadPixelData<Bgra32>(png.Pixels, png.Width, png.Height);
        image.SaveAsPng(Path.Combine(barcodePath, "png", $"barcode{i}.png"));

        // Also save to IG images folder for documentation
        image.SaveAsPng(Path.Combine(barcodeImagePath, $"barcode{i}.png"));

        // Generate InventoryItem FSH with predictable ID
        var inventoryItemId = $"gen-inv-{barcode.HISCode}-{i + 1}";

        // Escape the raw scan for FSH (replace GS char with unicode escape)
        var rawScanEscaped = rawScan.Replace("\u001d", "\\u001D");

        inventoryFsh.AppendLine($"Instance: {inventoryItemId}");
        inventoryFsh.AppendLine($"InstanceOf: InventoryItemEAHPInteroperability");
        inventoryFsh.AppendLine($"Title: \"Generated - {barcode.MedicationName} Pack #{i + 1}\"");
        inventoryFsh.AppendLine($"Description: \"Auto-generated InventoryItem for {barcode.MedicationName}. Batch: {barcode.BATCH}, Serial: {serialNumber}\"");
        inventoryFsh.AppendLine($"* status = #active");
        inventoryFsh.AppendLine($"* baseUnit = EAHPLogisticsUnitCS#indivisible-logistical-unit");
        inventoryFsh.AppendLine($"* netContent.value = {barcode.NetContentPerPack}");
        inventoryFsh.AppendLine($"* instance.identifier[rawScan].value = \"{rawScanEscaped}\"");
        inventoryFsh.AppendLine($"* instance.identifier[rawScan].type = EAHPIdentifierTypeCS#FMD_BARCODE");
        inventoryFsh.AppendLine($"* instance.identifier[serialNumber].value = \"{serialNumber}\"");
        inventoryFsh.AppendLine($"* instance.identifier[serialNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#SNO");
        inventoryFsh.AppendLine($"* instance.identifier[productBarCode].value = \"{barcode.GTIN}\"");
        inventoryFsh.AppendLine($"* instance.identifier[productBarCode].type = EAHPIdentifierTypeCS#PRODUCT_BARCODE");
        inventoryFsh.AppendLine($"* instance.lotNumber = \"{barcode.BATCH}\"");
        inventoryFsh.AppendLine($"* instance.expiry = \"{barcode.ExpiryDate}\"");
        inventoryFsh.AppendLine($"* productReference = Reference({barcode.HISCode})");
        inventoryFsh.AppendLine();

        // Track inventory item resource
        generatedResources.Add($"InventoryItem/{inventoryItemId}");
    }
}

// Write FSH files
File.WriteAllText(Path.Combine(fshOutputDir, "Generated-Medications.fsh"), medicationFsh.ToString());
File.WriteAllText(Path.Combine(fshOutputDir, "Generated-InventoryItems.fsh"), inventoryFsh.ToString());

// Generate summary markdown for the IG page
var summaryMd = new StringBuilder();
summaryMd.AppendLine("# Generated Barcode Examples");
summaryMd.AppendLine();
summaryMd.AppendLine("This page contains auto-generated examples created from barcode data. These examples demonstrate the relationship between physical product barcodes (GS1 Data Matrix) and their corresponding FHIR resources.");
summaryMd.AppendLine();
summaryMd.AppendLine("## How These Examples Were Generated");
summaryMd.AppendLine();
summaryMd.AppendLine("The [BarcodeGenerator](https://github.com/afriscic/EAHP_Interoperabillty/tree/main/BarcodeGenerator) tool reads `BarcodeInput.json` and generates:");
summaryMd.AppendLine();
summaryMd.AppendLine("1. **Data Matrix Barcodes** (SVG and PNG) - FMD-compliant GS1 barcodes");
summaryMd.AppendLine("2. **Medication FHIR Resources** - One per unique product (HIS code)");
summaryMd.AppendLine("3. **InventoryItem FHIR Resources** - One per physical pack with unique serial number");
summaryMd.AppendLine();
summaryMd.AppendLine("## Generated Medications");
summaryMd.AppendLine();
summaryMd.AppendLine("| HIS Code | Medication Name | GTIN | Manufacturer |");
summaryMd.AppendLine("|----------|-----------------|------|--------------|");

foreach (var barcode in barcodes)
{
    summaryMd.AppendLine($"| [{barcode.HISCode}](Medication-{barcode.HISCode}.html) | {barcode.MedicationName} | {barcode.GTIN} | {barcode.Manufacturer} |");
}

summaryMd.AppendLine();
summaryMd.AppendLine("## Generated Inventory Items");
summaryMd.AppendLine();
summaryMd.AppendLine("| Medication | Batch | Expiry | Items Generated |");
summaryMd.AppendLine("|------------|-------|--------|-----------------|");

foreach (var barcode in barcodes)
{
    summaryMd.AppendLine($"| {barcode.MedicationName} | {barcode.BATCH} | {barcode.ExpiryDate} | {barcode.No} |");
}

summaryMd.AppendLine();
summaryMd.AppendLine("## Barcode Format");
summaryMd.AppendLine();
summaryMd.AppendLine("The generated barcodes follow the GS1 Data Matrix format for FMD compliance:");
summaryMd.AppendLine();
summaryMd.AppendLine("```");
summaryMd.AppendLine("<GS>01<GTIN>10<BATCH><GS>17<EXPIRY>21<SERIAL>");
summaryMd.AppendLine("```");
summaryMd.AppendLine();
summaryMd.AppendLine("Where:");
summaryMd.AppendLine("- `<GS>` = ASCII 29 (Group Separator)");
summaryMd.AppendLine("- `01` = Application Identifier for GTIN");
summaryMd.AppendLine("- `10` = Application Identifier for Batch/Lot");
summaryMd.AppendLine("- `17` = Application Identifier for Expiry Date (YYMMDD)");
summaryMd.AppendLine("- `21` = Application Identifier for Serial Number");
summaryMd.AppendLine();
summaryMd.AppendLine("## Sample Barcode");
summaryMd.AppendLine();
summaryMd.AppendLine("Below is a sample of the generated barcodes (first item from each product):");
summaryMd.AppendLine();

foreach (var barcode in barcodes)
{
    summaryMd.AppendLine($"### {barcode.MedicationName}");
    summaryMd.AppendLine();
    summaryMd.AppendLine($"<img src=\"barcodes/{barcode.GTIN}/barcode0.png\" alt=\"Barcode for {barcode.GTIN}\" width=\"200\"/>");
    summaryMd.AppendLine();
}

File.WriteAllText("input/pagecontent/generated-examples.md", summaryMd.ToString());

// Update sushi-config.yaml with generated resources
UpdateSushiConfig(sushiConfigPath, generatedResources);

Console.WriteLine();
Console.WriteLine("Generation complete!");
Console.WriteLine($"  - Barcode images: {barcodeOutputDir}/ and {barcodeImageDir}/");
Console.WriteLine($"  - FSH files: {fshOutputDir}/");
Console.WriteLine($"  - Page content: input/pagecontent/generated-examples.md");
Console.WriteLine($"  - Updated: {sushiConfigPath}");

static void UpdateSushiConfig(string configPath, List<string> generatedResources)
{
    Console.WriteLine($"Updating {configPath} with {generatedResources.Count} generated resources...");

    var yaml = new YamlStream();
    using (var reader = new StreamReader(configPath))
    {
        yaml.Load(reader);
    }

    var root = (YamlMappingNode)yaml.Documents[0].RootNode;

    // Find or create groups node
    YamlMappingNode groupsNode;
    if (root.Children.ContainsKey("groups"))
    {
        groupsNode = (YamlMappingNode)root.Children["groups"];
    }
    else
    {
        groupsNode = new YamlMappingNode();
        root.Children.Add("groups", groupsNode);
    }

    // Create GeneratedExamples group
    var generatedExamplesNode = new YamlMappingNode
    {
        { "name", "Generated Examples" },
        { "description", "Auto-generated examples from barcode data (Demo Medications and Inventory Items)" }
    };

    // Add resources as a sequence
    var resourcesSequence = new YamlSequenceNode();
    foreach (var resource in generatedResources)
    {
        resourcesSequence.Add(resource);
    }
    generatedExamplesNode.Add("resources", resourcesSequence);

    // Update or add GeneratedExamples group
    if (groupsNode.Children.ContainsKey("GeneratedExamples"))
    {
        groupsNode.Children["GeneratedExamples"] = generatedExamplesNode;
    }
    else
    {
        groupsNode.Children.Add("GeneratedExamples", generatedExamplesNode);
    }

    // Write back to file
    using var writer = new StreamWriter(configPath);
    yaml.Save(writer, assignAnchors: false);
}

class BarcodeData
{
    public int No { get; set; }
    public required string GTIN { get; set; }
    public required string BATCH { get; set; }
    public required string HISCode { get; set; }
    public required string MedicationName { get; set; }
    public required string Manufacturer { get; set; }
    public int NetContentPerPack { get; set; }
    public required string ExpiryDate { get; set; }
}
