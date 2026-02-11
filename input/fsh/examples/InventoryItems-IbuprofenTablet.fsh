Instance: 8d043738-bf48-4a2b-aba5-a4a9e8744f63
InstanceOf: InventoryItemEAHPInteroperability
Title: "Inventory Item for GlobalPharma Ibuprofen 30x600mg Pack. This is a Partial Pack: just one tablet left in the pack"
Description: "InventoryItem instance representing a pack of Brufen 30x600mg tablets. This is a commercial pack (GS1 identified) that has been opened and depleted down to a single tablet."
* status = #active
* baseUnit = EAHPLogisticsUnitCS#indivisible-logistical-unit
* netContent.value = 1
* instance.identifier[rawScan].value = "01050991510150511078241PC\u001D17260530211HXNA4G4VM"
* instance.identifier[rawScan].type = EAHPIdentifierTypeCS#FMD_BARCODE
* instance.identifier[serialNumber].value = "1HXNA4G4VM"
* instance.identifier[serialNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#SNO
* instance.identifier[productBarCode].value = "05099151015051"
* instance.identifier[productBarCode].type = EAHPIdentifierTypeCS#PC
* instance.lotNumber = "78241PC"
* instance.expiry = "2026-05-30"
* productReference = Reference(M00345)

Instance: e2d2688f-2854-48ac-a87a-cb6f4105b36c
InstanceOf: InventoryItemEAHPInteroperability
Title: "Inventory Item for GlobalPharma Ibuprofen 30x600mg Pack"
Description: "InventoryItem instance representing a pack of Brufen 30x600mg tablets."
* status = #active
* baseUnit = EAHPLogisticsUnitCS#indivisible-logistical-unit
* netContent.value = 30
* instance.identifier[rawScan].value = "01050991510150511078241PC\u001D17260530211HXRG3R6T3"
* instance.identifier[rawScan].type = EAHPIdentifierTypeCS#FMD_BARCODE
* instance.identifier[serialNumber].value = "1HXRG3R6T3"
* instance.identifier[serialNumber].type = http://terminology.hl7.org/CodeSystem/v2-0203#SNO
* instance.identifier[productBarCode].value = "05099151015051"
* instance.identifier[productBarCode].type = EAHPIdentifierTypeCS#PC
* instance.lotNumber = "78241PC"
* instance.expiry = "2026-05-30"
* productReference = Reference(M00345)

Instance: 9042a2ba-724c-47e4-b64c-6054da9dd4fa
InstanceOf: InventoryItemEAHPInteroperability
Title: "Inventory Item for GlobalPharma Ibuprofen 30x600mg Unit Dose."
Description: "InventoryItem instance representing a unit dose of Brufen 30x600mg tablets."
* status = #active
* baseUnit = EAHPLogisticsUnitCS#indivisible-logistical-unit
* netContent.value = 1
* instance.identifier[vendorAssigned].value = "0123456789"
* instance.identifier[vendorAssigned].type = http://terminology.hl7.org/CodeSystem/v2-0203#RI
* instance.identifier[vendorAssigned].system = "http://myhospital.org/unidoserobot-1/pick-ids"
* instance.lotNumber = "78241PC"
* instance.expiry = "2026-05-30"
* productReference = Reference(M00345)