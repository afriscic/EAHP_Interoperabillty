Profile: SupplyDeliveryEAHPInteroperability
Title: "SupplyDelivery EAHP Interoperability"
Parent: SupplyDelivery
Description: "SupplyDelivery profile for EAHP Interoperability SIG."

* identifier MS
* basedOn MS
* suppliedItem.item[x] only Reference(InventoryItem)
* supplier MS
* destination MS
* supplier ^type.targetProfile[+] = "http://hl7.org/fhir/StructureDefinition/Device"
* receiver ^type.targetProfile[+] = "http://hl7.org/fhir/StructureDefinition/Device"
