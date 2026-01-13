Instance: SupplyRequest-IbuprofenTablet-Example
InstanceOf: SupplyRequestEAHPInteroperabillity
Title: "Example Supply Request for Ibuprofen Tablet 500mg"
Description: "Example of a supply request for Ibuprofen Tablet 500mg tablets using the EAHP Interoperability profile."
* identifier.value = "3f1c2d63-8e43-4c9f-9b7a-53c1b1e4f7da"
* item.reference = Reference(M00345)
* quantity.value = 2 //We need to define if we will always request in baseUnits
* authoredOn = "2025-11-30T10:30:00Z"
* requester = Reference(Device/loc-adc-cardio-01) "Cardiology Ward ADC"
* deliverFrom = Reference(Location/loc-robot-main) "Hospital Pharmacy"
* deliverTo = Reference(Location/loc-adc-cardio-01) "Cardiology Ward ADC"