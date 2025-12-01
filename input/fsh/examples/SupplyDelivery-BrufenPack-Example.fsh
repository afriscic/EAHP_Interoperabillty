Instance: SupplyDelivery-Brufen-Example
InstanceOf: SupplyDelivery
Title: "Example Supply Delivery for Brufen"
Description: "SupplyDelivery example corresponding to the SupplyRequest for Brufen tablets."

* identifier.value = "b4dde829-1395-43b0-8f31-8b8f3746bf12"
* basedOn = Reference(SupplyRequest-Brufen-Example)
* status = #completed
* item.reference = Reference(Medication-Brufen-30x600mg)
* quantity.value = 2
* quantity.unit = "pack"
* quantity.system = "http://unitsofmeasure.org"
* quantity.code = "{Pack}"
* occurrenceDateTime = "2025-11-30T11:15:00Z"

* supplier = Reference(Practitioner/example-technician) "Pharmacy Technician"
* destination = Reference(Location/example-pharmacy) "Hospital Pharmacy"
