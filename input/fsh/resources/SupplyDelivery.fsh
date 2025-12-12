Profile: SupplyDeliveryEAHPInteroperability
Title: "SupplyDelivery EAHP Interoperability"
Parent: SupplyDelivery
Description: "SupplyDelivery profile for EAHP Interoperability SIG."

* identifier MS
* basedOn MS
* suppliedItem 1..*
* suppliedItem.item[x] only Reference(InventoryItem)
* supplier MS
* destination MS
* supplier ^type.targetProfile[+] = "http://hl7.org/fhir/StructureDefinition/Device"
* supplier only Reference(Practitioner or Device)
* receiver ^type.targetProfile[+] = "http://hl7.org/fhir/StructureDefinition/Device"
* receiver only Reference(Practitioner or Device)

