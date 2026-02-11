Instance: SupplyRequest-IbuprofenTablet-Example
InstanceOf: SupplyRequestEAHPInteroperability
Title: "Example Supply Request for Ibuprofen Tablet 500mg"
Description: "Example of a supply request for Ibuprofen Tablet 500mg tablets using the EAHP Interoperability profile."
* identifier[requestId].value = "REQ-12345"
* identifier[requestId].type = EAHPSupplyRequestIdentifierTypeCS#RequestId
* identifier[requestId].system = "http://hospital-system.org/requests" // Best practice to include a system

* item.reference = Reference(M00345)
* quantity.value = 2
* authoredOn = "2025-11-30T10:30:00Z"
* requester = Reference(Device/loc-adc-cardio-01) "Cardiology Ward ADC"
* deliverFrom = Reference(Location/loc-robot-main) "Hospital Pharmacy"
* deliverTo = Reference(Location/loc-adc-cardio-01) "Cardiology Ward ADC"