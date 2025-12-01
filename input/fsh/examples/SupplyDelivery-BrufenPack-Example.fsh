Instance: SupplyDelivery-BrufenPack-Example
InstanceOf: SupplyDelivery
Title: "Example Supply Delivery for Brufen"
Description: "SupplyDelivery example corresponding to the SupplyRequest for Brufen tablets."

* basedOn = Reference(SupplyRequest-Brufen-Example)
* status = #completed
* suppliedItem[0].itemReference = Reference(8d043738-bf48-4a2b-aba5-a4a9e8744f63)
* suppliedItem[0].quantity.value = 1
* suppliedItem[0].quantity.system = "http://hl7.org/fhir/medicinal-product-package-type"
* suppliedItem[0].quantity.code = #100000143555
* suppliedItem[0].quantity.unit = "Pack"

* suppliedItem[1].itemReference = Reference(e2d2688f-2854-48ac-a87a-cb6f4105b36c)
* suppliedItem[1].quantity.value = 1
* suppliedItem[1].quantity.system = "http://hl7.org/fhir/medicinal-product-package-type"
* suppliedItem[1].quantity.code = #100000143555
* suppliedItem[1].quantity.unit = "Pack"

* supplier = Reference(Practitioner/example-technician) "Pharmacy Technician"
* destination = Reference(Location/example-pharmacy) "Hospital Pharmacy"

* contained[0] = 8d043738-bf48-4a2b-aba5-a4a9e8744f63
* contained[1] = e2d2688f-2854-48ac-a87a-cb6f4105b36c