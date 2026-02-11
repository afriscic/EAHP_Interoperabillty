using Hl7.Fhir.Model;

namespace BarcodeGenerator;

public static class Generator
{
    public static List<Organization> GenerateOrganizations()
    {
        return [
            new()
            {
                Id = "SC1",
                Name = "Smart cart 1"
            },
            new()
            {
                Id = "ADC1",
                Name = "Automatic dispensing cabinet 1"
            }
        ];
    }

    public static Medication GenerateMedication(string id, string name, string doseCode)
    {
        return new()
        {
            Id = id,
            Code = new CodeableConcept { Text = name },
            DoseForm = new CodeableConcept("http://hl7.org/fhir/ValueSet/medication-form-codes", doseCode)
        };
    }

    public static SupplyRequest SupplyRequestExample(string itemId, decimal quantity)
    {
        return new SupplyRequest
        {
            Id = Guid.CreateVersion7().ToString(),
            Status = SupplyRequest.SupplyRequestStatus.Active,
            Item = new CodeableReference(new ResourceReference(itemId)),
            Quantity = new Quantity { Value = quantity },
            AuthoredOn = DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ssZ"),
            Requester = new ResourceReference("SC1"),
            Supplier = [new ResourceReference("ADC1")]
        };
    }

    public static SupplyDelivery SupplyDeliveryExample(string requestId, List<InventoryItem> items)
    {
        var delivery = new SupplyDelivery
        {
            Id = Guid.CreateVersion7().ToString(),
            BasedOn = [new ResourceReference(requestId)],
            Status = SupplyDelivery.SupplyDeliveryStatus.Completed,
            Supplier = new ResourceReference("ADC1"),
            Receiver = [new ResourceReference("SC1")]
        };
        
        foreach (var item in items)
        {
            delivery.SuppliedItem.Add(new SupplyDelivery.SuppliedItemComponent()
            {
               Quantity = new Quantity { Value = 1 },
               Item = new ResourceReference(item.Id)
            });
            delivery.Contained.Add(item);
        }

        return delivery;
    }

    public static InventoryItem GenerateInventoryItem(
        decimal quantity,
        string lot,
        string medicationID,
        string? hisCode,
        string? barCode,
        string? productCode,
        string? resourceIdentifier,
        string? serialNumber
    )
    {
        var item = new InventoryItem
        {
            Id = Guid.CreateVersion7().ToString(),
            Status = InventoryItem.InventoryItemStatusCodes.Active,
            NetContent = new Quantity { Value = quantity },
            Instance = new InventoryItem.InstanceComponent()
            {
                LotNumber = lot,
                Expiry = "2026-03-31"
            },
            ProductReference = new ResourceReference(medicationID)
        };


        if (!string.IsNullOrWhiteSpace(barCode))
            item.Instance.Identifier.Add(new Identifier
            {
                Type = new CodeableConcept(
                    "https://afriscic.github.io/EAHP_Interoperabillty/CodeSystem/eahp-identifier-type-cs",
                    "FMD_BARCODE"),
                Value = barCode
            });

        if (!string.IsNullOrWhiteSpace(hisCode))
            item.Instance.Identifier.Add(new Identifier
            {
                Type = new CodeableConcept(
                    "https://afriscic.github.io/EAHP_Interoperabillty/CodeSystem/eahp-identifier-type-cs",
                    "HIS_CODE"),
                Value = hisCode
            });

        if (!string.IsNullOrWhiteSpace(productCode))
            item.Instance.Identifier.Add(new Identifier
            {
                Type = new CodeableConcept(
                    "https://afriscic.github.io/EAHP_Interoperabillty/CodeSystem/eahp-identifier-type-cs",
                    "PC"),
                Value = productCode
            });

        if (!string.IsNullOrWhiteSpace(resourceIdentifier))
            item.Instance.Identifier.Add(new Identifier
            {
                Type = new CodeableConcept(
                    "http://terminology.hl7.org/CodeSystem/v2-0203",
                    "RI"),
                Value = resourceIdentifier
            });

        if (!string.IsNullOrWhiteSpace(serialNumber))
            item.Instance.Identifier.Add(new Identifier
            {
                Type = new CodeableConcept(
                    "http://terminology.hl7.org/CodeSystem/v2-0203",
                    "SNO"),
                Value = serialNumber
            });
        
        return item;
    }
}