Instance: InventoryReport-Brufen-Example
InstanceOf: InventoryReport
Title: "Inventory Report for Brufen 600mg Tablets"
Description: "InventoryReport documenting the current stock of Brufen 600mg tablets in the hospital pharmacy, both packs and unit doeses."

* status = #active
* countType = #snapshot
* reportedDateTime = "2024-12-01T10:30:00Z"

* reporter = Reference(Practitioner/example-pharmacist) "Hospital Pharmacist"

* reportingPeriod.start = "2024-12-01T00:00:00Z"
* reportingPeriod.end = "2024-12-01T23:59:59Z"

* inventoryListing[0].countingDateTime = "2024-12-01T10:00:00Z"
* inventoryListing[0].item[0].quantity.value = 1
* inventoryListing[0].item[0].quantity.system = "http://hl7.org/fhir/medicinal-product-package-type"
* inventoryListing[0].item[0].quantity.code = #100000143555
* inventoryListing[0].item[0].item = Reference(8d043738-bf48-4a2b-aba5-a4a9e8744f63) "Brufen 30x600mg Pack - Lot 78241PC"

* inventoryListing[0].item[1].quantity.value = 1
* inventoryListing[0].item[1].quantity.system = "http://hl7.org/fhir/medicinal-product-package-type"
* inventoryListing[0].item[1].quantity.code = #100000143555
* inventoryListing[0].item[1].item = Reference(e2d2688f-2854-48ac-a87a-cb6f4105b36c) "Brufen 30x600mg Pack - Lot 78241PC"

* inventoryListing[0].item[2].quantity.value = 30
* inventoryListing[0].item[2].quantity.system = "http://snomed.info/sct"
* inventoryListing[0].item[2].quantity.code = #421026006
* inventoryListing[0].item[2].item = Reference(9042a2ba-724c-47e4-b64c-6054da9dd4fa) "Brufen 30x600mg Unit dose - Lot 78241PC"

* inventoryListing[0].location = Reference(Location/example-pharmacy) "Hospital Pharmacy"

* contained[0] = 8d043738-bf48-4a2b-aba5-a4a9e8744f63
* contained[1] = e2d2688f-2854-48ac-a87a-cb6f4105b36c
* contained[2] = 9042a2ba-724c-47e4-b64c-6054da9dd4fa