using System.Text.Json;
using BarcodeGenerator;
using Hl7.Fhir.Model;
using Hl7.Fhir.Serialization;
using NanoidDotNet;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.PixelFormats;
using ZXing;
using ZXing.Common;
using ZXing.Rendering;

Console.WriteLine("Starting Barcode and FHIR JSON Generator...");

var baseOutputDir = "GeneratedResources";

if (Directory.Exists(baseOutputDir))
    Directory.Delete(baseOutputDir, true);

Directory.CreateDirectory(baseOutputDir);

var text = File.ReadAllText("BarcodeInput.json");
var barcodes = JsonSerializer.Deserialize<BarcodeData[]>(text);
ArgumentNullException.ThrowIfNull(barcodes);

var medications = new List<Medication>();
var items = new List<InventoryItem>();

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

foreach (var barcode in barcodes)
{
    var medication = medications.FirstOrDefault(f => f.Id == barcode.HISCode);
    if (medication is null)
    {
        medication = Generator.GenerateMedication(barcode.HISCode, barcode.MedicationName, barcode.DoseCode);
        medications.Add(medication);

        var json = FhirJsonSerializer.Default.SerializeToString(medication, true);
        var medPath = Path.Combine(baseOutputDir, "medications", $"{medication.Id}.json");
        Directory.CreateDirectory(Path.GetDirectoryName(medPath)!);
        File.WriteAllText(medPath, json);
    }

    var sn = Nanoid.Generate(Nanoid.Alphabets.LettersAndDigits, 10);

    for (int i = 0; i < barcode.No; i++)
    {
        string? ri = null;

        if (barcode.NetContentPerPack > 1)
            sn = Nanoid.Generate(Nanoid.Alphabets.LettersAndDigits, 10);
        else
            ri = Guid.CreateVersion7().ToString();

        var exp = "260331";
        var rawScan = $"{(char)29}01{barcode.GTIN}10{barcode.BATCH}{(char)29}17{exp}21{sn}";
        var matrix = writer.Encode(rawScan);

        var svg = svgRenderer.Render(matrix, BarcodeFormat.DATA_MATRIX, string.Empty);
        var svgPath = Path.Combine(baseOutputDir, "images", barcode.GTIN, "svg", $"barcode{i}.svg");
        Directory.CreateDirectory(Path.GetDirectoryName(svgPath)!);
        File.WriteAllText(svgPath, svg.Content);
        var png = pixelRenderer.Render(matrix, BarcodeFormat.DATA_MATRIX, string.Empty);
        var pngPath = Path.Combine(baseOutputDir, "images", barcode.GTIN, "png", $"barcode{i}.png");
        Directory.CreateDirectory(Path.GetDirectoryName(pngPath)!);
        using var image = Image.LoadPixelData<Bgra32>(png.Pixels, png.Width, png.Height);
        image.SaveAsPng(pngPath);

        var item = Generator.GenerateInventoryItem(barcode.NetContentPerPack, barcode.BATCH, barcode.HISCode, barcode.HISCode, rawScan, barcode.GTIN, ri, sn);
        items.Add(item);

        var json = FhirJsonSerializer.Default.SerializeToString(item, true);
        var itemPath = Path.Combine(baseOutputDir, "inventoryitems", $"Inv-{medication.Id}-{barcode.NetContentPerPack}-{i}.json");
        Directory.CreateDirectory(Path.GetDirectoryName(itemPath)!);
        File.WriteAllText(itemPath, json);
    }
}

var orgs = Generator.GenerateOrganizations();
foreach (var org in orgs)
{
    var json = FhirJsonSerializer.Default.SerializeToString(org, true);
    var orgPath = Path.Combine(baseOutputDir, "organizations", $"{org.Id}.json");
    Directory.CreateDirectory(Path.GetDirectoryName(orgPath)!);
    File.WriteAllText(orgPath, json);
}

if (items.Count == 0)
    throw new InvalidOperationException("No inventory items were generated.");

var itemF = items.First();
var medicationId = itemF.ProductReference?.Reference;
var quantity = itemF.NetContent?.Value;

if (quantity is null || string.IsNullOrWhiteSpace(medicationId))
    throw new InvalidOperationException("First inventory item is missing ProductReference or NetContent.");

var request = Generator.SupplyRequestExample(medicationId, quantity ?? 0);
var delivery = Generator.SupplyDeliveryExample(request.Id ?? throw new Exception(), [itemF]);

var requestJson = FhirJsonSerializer.Default.SerializeToString(request, true);
var deliveryJson = FhirJsonSerializer.Default.SerializeToString(delivery, true);

File.WriteAllText(Path.Combine(baseOutputDir, "SupplyRequestExample.json"), requestJson);
File.WriteAllText(Path.Combine(baseOutputDir, "SupplyDeliveryExample.json"), deliveryJson);

Console.WriteLine("Finished!");

class BarcodeData
{
    public int No { get; set; }
    public required string GTIN { get; set; }
    public required string BATCH { get; set; }
    public required string HISCode { get; set; }
    public required string MedicationName { get; set; }
    public int NetContentPerPack { get; set; }
    public required string DoseCode { get; set; }
}
