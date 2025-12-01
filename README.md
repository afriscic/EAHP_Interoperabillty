# EAHP Interoperability FHIR Implementation Guide

This repository contains the EAHP Interoperability FHIR Implementation Guide (IG), supporting standardized exchange of medication supply, inventory, and delivery information for hospital pharmacies.

## Project Structure

- `input/fsh/resources/`: FSH profiles defining how FHIR resources are tailored for EAHP use cases.
- `input/fsh/examples/`: Example FSH instances demonstrating real-world scenarios.
- `sushi-config.yaml`: SUSHI configuration for IG generation.
- `.github/workflows/publish.yml`: GitHub Actions workflow for building and publishing the IG.

## Resources

### SupplyRequestEAHPInteroperabillity
Defines requirements for requesting medication or supplies within a hospital pharmacy context. It specifies mandatory fields such as requester, item, quantity, and delivery details to ensure interoperability.

### SupplyDeliveryEAHPInteroperability
Describes how supply deliveries are recorded, including delivered items, quantities, and delivery status. This profile ensures consistent documentation of supply fulfillment.

### InventoryItemEAHPInteroperability
Standardizes the representation of inventory items, including medication details, packaging, and identification codes. It supports accurate tracking and reporting of stock.

## Examples

### SupplyRequest-Brufen-Example
Shows a request for Brufen (Ibuprofen) medication, including requester, quantity, and delivery instructions. Demonstrates how to structure a supply request for a specific medication.

### SupplyDelivery-BrufenPack-Example
Represents the delivery of a pack of Brufen, detailing the delivered item, quantity, and delivery date. Useful for illustrating supply fulfillment workflows.

### InventoryReport-Brufen-Exapmle
Provides a snapshot of Brufen inventory, including current stock levels and item details. Helps pharmacies report and monitor medication availability.

### InventoryItems-Brufen
Lists Brufen as an inventory item, with attributes like packaging, identification codes, and manufacturer. Supports inventory management and reconciliation.

### Medication-Brufen-Example
Defines the Brufen medication resource, including active ingredients, strength, and form. Ensures consistent medication identification across systems.

## Build & Publish

This IG uses [SUSHI](https://fshschool.org/docs/sushi/) to generate FHIR definitions from FSH files.

### Prerequisites

- Node.js (v18+)
- Java (v17+)
- Ruby (v3.2+)
- SUSHI (`npm install -g fsh-sushi`)
- Jekyll (`gem install jekyll bundler`)

### Build Locally

```sh
sushi .
java -jar path/to/publisher.jar -ig .
```

### GitHub Pages Deployment

On push to `main`, the workflow in `.github/workflows/publish.yml` will:
- Build FHIR definitions with SUSHI
- Run IG Publisher
- Deploy the output to GitHub Pages

## License

Copyright © 2025 EAHP.

---

For more information, see `sushi-config.yaml` and the FSH files in `input/fsh/`.