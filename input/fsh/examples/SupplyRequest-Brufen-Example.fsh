Instance: SupplyRequest-Brufen-Example
InstanceOf: SupplyRequestEAHPInteroperabillity
Title: "Example Supply Request for Brufen"
Description: "Example of a supply request for Brufen tablets using the EAHP Interoperability profile."
* identifier.value = "3f1c2d63-8e43-4c9f-9b7a-53c1b1e4f7da"
* item.reference = Reference(05099151015051)
* quantity.value = 2 //We need to define if we will always request in baseUnits
* authoredOn = "2025-11-30T10:30:00Z"
* requester = Reference(Device/adc-device) "Automated Dispensing Cabinet"
* deliverTo = Reference(Location/example-pharmacy) "Hospital Pharmacy"
* deliverFrom = Reference(Organization/sinteco) "Athena"