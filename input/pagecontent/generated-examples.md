# Generated Barcode Examples

This page contains auto-generated examples created from barcode data. These examples demonstrate the relationship between physical product barcodes (GS1 Data Matrix) and their corresponding FHIR resources.

## How These Examples Were Generated

The [BarcodeGenerator](https://github.com/afriscic/EAHP_Interoperabillty/tree/main/BarcodeGenerator) tool reads `BarcodeInput.json` and generates:

1. **Data Matrix Barcodes** (SVG and PNG) - FMD-compliant GS1 barcodes
2. **Medication FHIR Resources** - One per unique product (HIS code)
3. **InventoryItem FHIR Resources** - One per physical pack with unique serial number

## Generated Medications

| HIS Code | Medication Name | GTIN | Manufacturer |
|----------|-----------------|------|--------------|
| [MED001](Medication-MED001.html) | Demo Medication A 100mg Tablets | 02012345678903 | PharmaCorp |
| [MED002](Medication-MED002.html) | Demo Medication B 500mg Capsules | 02011111111118 | HealthMeds Inc |
| [MED003](Medication-MED003.html) | Demo Medication C 250mg Syrup | 02064721898122 | MediGlobal |

## Generated Inventory Items

| Medication | Batch | Expiry | Items Generated |
|------------|-------|--------|-----------------|
| Demo Medication A 100mg Tablets | BARCELONA2026 | 2026-03-20 | 10 |
| Demo Medication B 500mg Capsules | EAHP | 2026-12-31 | 5 |
| Demo Medication C 250mg Syrup | CONGRESS | 2027-06-30 | 2 |

## Barcode Format

The generated barcodes follow the GS1 Data Matrix format for FMD compliance:

```
<GS>01<GTIN>10<BATCH><GS>17<EXPIRY>21<SERIAL>
```

Where:
- `<GS>` = ASCII 29 (Group Separator)
- `01` = Application Identifier for GTIN
- `10` = Application Identifier for Batch/Lot
- `17` = Application Identifier for Expiry Date (YYMMDD)
- `21` = Application Identifier for Serial Number

## Sample Barcode

Below is a sample of the generated barcodes (first item from each product):

### Demo Medication A 100mg Tablets

<img src="barcodes/02012345678903/barcode0.png" alt="Barcode for 02012345678903" width="200"/>

### Demo Medication B 500mg Capsules

<img src="barcodes/02011111111118/barcode0.png" alt="Barcode for 02011111111118" width="200"/>

### Demo Medication C 250mg Syrup

<img src="barcodes/02064721898122/barcode0.png" alt="Barcode for 02064721898122" width="200"/>

