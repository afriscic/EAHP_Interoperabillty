Profile: MedicationEAHP
Title: "Medication EAHP Interoperability"
Parent: Medication
Description: "Medication profile for EAHP Interoperability. Focuses on the package configuration (Pack Size) rather than chemical ingredients. It establishes the HIS code as the single source of truth."

* code 1..1 MS
  * ^short = "Code of the medication in the HIS."
  * ^definition = "Code of the medication in the HIS. Automations are not the owner of the item master data, the HIS is. To enable seamless interoperability, all the automations MUST use the HIS item code." 
* status MS

// CHANGE 1: In R5, this is named 'doseForm', not 'form'
* doseForm MS 

// REMOVE ingredients entirely
* ingredient 0..0

// CHANGE 2: 'amount' (Ratio) does not exist in R5 Medication. 
// We use 'totalVolume' (Quantity) to define the specific quantity in this product.
* totalVolume 1..1 MS
  * ^short = "Strict definition of Pack Size (e.g. 30 units)"
  * ^definition = "The total quantity of medication contained in this package."

// We constrain the Quantity definition
* totalVolume.value 1..1
* totalVolume.unit = "unit" // Strictly forces the string "unit" (or "tablet", "pill", etc)