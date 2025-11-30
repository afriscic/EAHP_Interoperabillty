Profile: SupplyRequestEAHPInteroperabillity
Title: "SupplyRequest EAHP Interoperability"
Parent: SupplyRequest
Description: "SupplyRequest profile for EAHP Interoperability SIG."

* item.reference only Reference(Medication or InventoryItem)
* item.reference ^short = "Requested product must be a Medication or InventoryItem"
* item.reference ^definition = "The requested supply item, limited to references to Medication or InventoryItem resources."
* identifier 1..1
* basedOn MS
* priority MS
* authoredOn MS
* requester only Reference(Practitioner or Device)
* deliverFrom MS
* deliverTo MS
* deliverTo only Reference(Organization or Location)