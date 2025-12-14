Profile: SupplyRequestEAHPInteroperabillity
Title: "SupplyRequest EAHP Interoperability"
Parent: SupplyRequest
Description: "SupplyRequest profile for EAHP Interoperability SIG."

* implicitRules 0..0 //Removed for better readability and to leave only relevant fields on the IG
* contained  0..0 //Removed for better readability and to leave only relevant fields on the IG
* modifierExtension	0..0 //Removed for better readability  and to leave only relevant fields on the IG
* item only CodeableReference(Medication or InventoryItem)
* item.concept 0..0
* item ^short = "Requested product must be a Medication or InventoryItem"
* item ^definition = "The requested supply item, limited to references to Medication or InventoryItem resources."
* identifier 1..1
* status 0..0 //Removed status as it is out of scope for EAHP
* priority MS
* authoredOn 1..1 //Forced cardinality to ensure authoredOn is always present
* authoredOn MS
* requester only Reference(Organization or Practitioner or Device) //Add Organization as it will be not always a specific practitioner or device making the request
* deliverFrom 1..1 //Forced cardinality to ensure deliverFrom is always present
* deliverFrom MS
* deliverFrom only Reference(Organization or Location)
* deliverTo MS
* deliverTo 1..1 //Forced cardinality to ensure deliverTo is always present
* deliverTo only Reference(Organization or Location)