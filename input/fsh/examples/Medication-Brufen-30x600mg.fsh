Instance: Medication-Brufen-30x600mg
InstanceOf: Medication
Title: "Brufen 30x600mg Tablets"
Description: "Medication resource representing Brufen tablets, 30 tablets of 600 mg each."

// Identifier using GTIN
* identifier[0].system = "http://hl7.org/fhir/sid/gtin"
* identifier[0].value = "0123456789012"  // replace with actual GTIN

// Code (human-readable)
* code.text = "Brufen 600mg Tablets"

// Dose form
* doseForm.text = "Tablet"

// Ingredient (active ingredient: Ibuprofen)
* ingredient[0].itemCodeableConcept.text = "Ibuprofen"
* ingredient[0].isActive = true

// Strength as a Ratio (600 mg per 1 tablet)
* ingredient[0].strengthRatio.numerator.value = 600
* ingredient[0].strengthRatio.numerator.unit = "mg"
* ingredient[0].strengthRatio.denominator.value = 1
* ingredient[0].strengthRatio.denominator.unit = "tablet"

// Status
* status = #active
