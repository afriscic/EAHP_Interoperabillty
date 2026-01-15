Instance: SupplyDelivery-IbuprofenTabletPack-Example
InstanceOf: SupplyDeliveryEAHPInteroperability
Title: "Example Supply Delivery for Ibuprofen Tablet Packs"
Description: "SupplyDelivery example corresponding to the SupplyRequest for IbuprofenTablet tablets. It contains two InventoryItem instances representing packs of Ibuprofen Tablet 30x600mg tablets."

* basedOn = Reference(SupplyRequest-IbuprofenTablet-Example)
* status = #completed
* suppliedItem[0].itemReference = Reference(9042a2ba-724c-47e4-b64c-6054da9dd4fa)
* contained[0] = 9042a2ba-724c-47e4-b64c-6054da9dd4fa
* suppliedItem[1].itemReference = Reference(8d043738-bf48-4a2b-aba5-a4a9e8744f63)
* contained[1] = 8d043738-bf48-4a2b-aba5-a4a9e8744f63
* supplier.extension[supplierDevice].valueReference = Reference(Device/dev-robot-wholepack-01)
* supplier.display = "Central Pharmacy Robot"
* destination = Reference(Location/loc-adc-cardio-01) "Cardiology Automated Dispensing Cabiner"