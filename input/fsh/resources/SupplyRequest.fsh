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
* deliverFrom 1..1
* deliverFrom MS
* deliverFrom only Reference(Location)
* deliverFrom ^short = "The automatic location reperesenting the automation that should supply the medications"
* deliverTo MS
* deliverTo only Reference(Organization or Location)
* deliverTo ^short = "The destination of the supply request. If it must be delivered to an automation, this must be a location linked with the device representing the automation."