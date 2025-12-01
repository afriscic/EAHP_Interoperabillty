// SupplyRequest Instance with contained Medication
Instance: SupplyRequest-Brufen-Example
InstanceOf: SupplyRequestEAHPInteroperabillity
Title: "Example Supply Request for Brufen"
Description: "Example of a supply request for Brufen tablets using the EAHP Interoperability profile."
* contained = 0123456789012
* identifier.value = "3f1c2d63-8e43-4c9f-9b7a-53c1b1e4f7da"
* item.reference = Reference(#0123456789012) Usage: #inline
* quantity.value = 2 //We need to define if we will always request in baseUnits
* authoredOn = "2025-11-30T10:30:00Z"
* requester = Reference(Device/ADC-Device) "Automated Dispensing Cabinet"
* deliverTo = Reference(Location/Hospital-Pharmacy) "Hospital Pharmacy"