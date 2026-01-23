Profile: SupplyDeliveryEAHPInteroperability
Title: "SupplyDelivery EAHP Interoperability"
Parent: SupplyDelivery
Description: "SupplyDelivery profile for EAHP Interoperability SIG."

* identifier MS
* basedOn MS
* suppliedItem.item[x] only Reference(InventoryItem)
* suppliedItem.item[x] ^type.aggregation = #contained
* suppliedItem.quantity MS
* supplier MS
* supplier.extension contains SupplierDevice named supplierDevice 0..1
* supplier.extension[supplierDevice].valueReference only Reference(Device)
* destination MS

Extension: SupplierDevice
Id: supplier-device
Title: "Supplier Device"
Description: "An extension to enable a Device resource to be the supplier."
* value[x] only Reference(Device)
