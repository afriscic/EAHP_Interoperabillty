Resource: InventoryReport
Id: InventoryReport
Description: "A report of inventory or stock items."
* ^meta.lastUpdated = "2023-03-26T15:21:02.749+11:00"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-category"
* ^extension[=].valueString = "Clinical.Request &amp; Response"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 0
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-security-category"
* ^extension[=].valueCode = #business
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #oo
* ^url = "http://hl7.org/fhir/StructureDefinition/InventoryReport"
* ^status = #draft
* ^experimental = true
* ^date = "2023-03-26T15:21:02+11:00"
* ^publisher = "Health Level Seven International (Orders and Observations)"
* ^contact[0].telecom.system = #url
* ^contact[=].telecom.value = "http://hl7.org/fhir"
* ^contact[+].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/orders/index.cfm"
* ^jurisdiction.coding.system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction.coding.code = #001
* ^jurisdiction.coding.display = "World"
* . ^short = "A report of inventory or stock items"
* . ^definition = "A report of inventory or stock items."
* . ^mustSupport = false
* . ^isModifier = false
* identifier 0..* SU Identifier "Business identifier for the report" "Business identifier for the InventoryReport."
* identifier ^mustSupport = false
* identifier ^isModifier = false
* status 1..1 ?! SU code "draft | requested | active | entered-in-error" "The status of the inventory check or notification - whether this is draft (e.g. the report is still pending some updates) or active."
* status from http://hl7.org/fhir/ValueSet/inventoryreport-status|5.0.0 (required)
* status ^mustSupport = false
* status ^isModifierReason = "This element is labelled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid"
* status ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* status ^binding.extension.valueString = "InventoryReportStatus"
* status ^binding.description = "The status of the InventoryReport."
* countType 1..1 ?! SU code "snapshot | difference" "Whether the report is about the current inventory count (snapshot) or a differential change in inventory (change)."
* countType from http://hl7.org/fhir/ValueSet/inventoryreport-counttype|5.0.0 (required)
* countType ^mustSupport = false
* countType ^isModifierReason = "Not known why this is labelled a modifier"
* countType ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* countType ^binding.extension.valueString = "InventoryCountType"
* countType ^binding.description = "The type of count."
* operationType 0..1 SU CodeableConcept "addition | subtraction" "What type of operation is being performed - addition or subtraction."
* operationType ^mustSupport = false
* operationType ^isModifier = false
* operationTypeReason 0..1 SU CodeableConcept "The reason for this count - regular count, ad-hoc count, new arrivals, etc" "The reason for this count - regular count, ad-hoc count, new arrivals, etc."
* operationTypeReason ^mustSupport = false
* operationTypeReason ^isModifier = false
* reportedDateTime 1..1 SU dateTime "When the report has been submitted" "When the report has been submitted."
* reportedDateTime ^mustSupport = false
* reportedDateTime ^isModifier = false
* reporter 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://hl7.org/fhir/StructureDefinition/Device) "Who submits the report" "Who submits the report."
* reporter ^mustSupport = false
* reporter ^isModifier = false
* reporter ^isSummary = false
* reportingPeriod 0..1 Period "The period the report refers to" "The period the report refers to."
* reportingPeriod ^mustSupport = false
* reportingPeriod ^isModifier = false
* reportingPeriod ^isSummary = false
* inventoryListing 0..* SU BackboneElement "An inventory listing section (grouped by any of the attributes)" "An inventory listing section (grouped by any of the attributes)."
* inventoryListing ^mustSupport = false
* inventoryListing ^isModifier = false
* inventoryListing.location 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Location) "Location of the inventory items" "Location of the inventory items."
* inventoryListing.location ^mustSupport = false
* inventoryListing.location ^isModifier = false
* inventoryListing.location ^isSummary = false
* inventoryListing.itemStatus 0..1 SU CodeableConcept "The status of the items that are being reported" "The status of the items."
* inventoryListing.itemStatus ^mustSupport = false
* inventoryListing.itemStatus ^isModifier = false
* inventoryListing.countingDateTime 0..1 dateTime "The date and time when the items were counted" "The date and time when the items were counted."
* inventoryListing.countingDateTime ^mustSupport = false
* inventoryListing.countingDateTime ^isModifier = false
* inventoryListing.countingDateTime ^isSummary = false
* inventoryListing.item 0..* SU BackboneElement "The item or items in this listing" "The item or items in this listing."
* inventoryListing.item ^mustSupport = false
* inventoryListing.item ^isModifier = false
* inventoryListing.item.category 0..1 SU CodeableConcept "The inventory category or classification of the items being reported" "The inventory category or classification of the items being reported. This is meant not for defining the product, but for inventory categories e.g. 'pending recount' or 'damaged'."
* inventoryListing.item.category ^mustSupport = false
* inventoryListing.item.category ^isModifier = false
* inventoryListing.item.quantity 1..1 SU Quantity "The quantity of the item or items being reported" "The quantity of the item or items being reported."
* inventoryListing.item.quantity ^mustSupport = false
* inventoryListing.item.quantity ^isModifier = false
* inventoryListing.item.item 1..1 SU CodeableReference(http://hl7.org/fhir/StructureDefinition/Medication or http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/Medication or http://hl7.org/fhir/StructureDefinition/NutritionProduct or http://hl7.org/fhir/StructureDefinition/InventoryItem or http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct or http://hl7.org/fhir/StructureDefinition/InventoryItem) "The code or reference to the item type" "The code or reference to the item type."
* inventoryListing.item.item ^mustSupport = false
* inventoryListing.item.item ^isModifier = false
* note 0..* Annotation "A note associated with the InventoryReport" "A note associated with the InventoryReport."
* note ^mustSupport = false
* note ^isModifier = false
* note ^isSummary = false