Profile: SupplyRequestEAHPInteroperabillity
Title: "SupplyRequest EAHP Interoperability"
Parent: SupplyRequest
Description: "SupplyRequest profile for EAHP Interoperability SIG."

* item only CodeableReference(Medication or InventoryItem)
* item.concept 0..0
* item ^short = "Requested product must be a Medication or InventoryItem"
* item ^definition = "The requested supply item, limited to references to Medication or InventoryItem resources."
* identifier 1..1
* priority MS
* authoredOn MS
* requester only Reference(Practitioner or Device)
* deliverFrom MS
* deliverTo MS
* deliverTo only Reference(Organization or Location)