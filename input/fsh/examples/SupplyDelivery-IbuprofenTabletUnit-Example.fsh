Instance: SupplyDelivery-IbuprofenTabletUnit-Example
InstanceOf: SupplyDeliveryEAHPInteroperability
Title: "Example Supply Delivery for Ibuprofen 500mg Unit Dose Tablets"
Description: "SupplyDelivery example corresponding to the SupplyRequest for Ibuprofen 500mg unit dose tablets."

* basedOn = Reference(SupplyRequest-IbuprofenTablet-Example)
* status = #completed
* suppliedItem[0].itemReference = Reference(9042a2ba-724c-47e4-b64c-6054da9dd4fa)
* contained[0] = 9042a2ba-724c-47e4-b64c-6054da9dd4fa
* supplier.extension[supplierDevice].valueReference = Reference(Device/dev-robot-wholepack-01)
* supplier.display = "Central Pharmacy Robot"
* destination = Reference(Location/loc-adc-cardio-01) "Cardiology Automated Dispensing Cabiner"
