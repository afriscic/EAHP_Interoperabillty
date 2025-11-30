Profile: SupplyRequestEAHPInteroperabillity
Title: "SupplyRequest EAHP Interoperability"
Parent: SupplyRequest
Description: "SupplyRequest profile for EAHP Interoperability SIG."

* item[x] only Reference(Medication or InventoryItem)
* item[x].^short = "Requested product must be a Medication or an InventoryItem"
* item[x].^definition = "The requested supply item, limited to Medication or InventoryItem references."

* identifier 1..1

* basedOn MS
* priority MS
* authoredOn MS

* requester only Reference(Practitioner or Device)

* deliverFrom MS
* deliverTo MS
* deliverTo only Reference(Organization or Location)
