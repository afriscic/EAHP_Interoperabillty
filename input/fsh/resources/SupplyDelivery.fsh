Resource: SupplyDelivery
Id: SupplyDelivery
Description: "Record of delivery of what is supplied."
* ^meta.lastUpdated = "2023-03-26T15:21:02.749+11:00"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-category"
* ^extension[=].valueString = "Clinical.Request &amp; Response"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-security-category"
* ^extension[=].valueCode = #patient
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #oo
* ^url = "http://hl7.org/fhir/StructureDefinition/SupplyDelivery"
* ^status = #draft
* ^experimental = false
* ^date = "2023-03-26T15:21:02+11:00"
* ^publisher = "Health Level Seven International (Orders and Observations)"
* ^contact[0].telecom.system = #url
* ^contact[=].telecom.value = "http://hl7.org/fhir"
* ^contact[+].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/orders/index.cfm"
* ^jurisdiction.coding.system = "http://unstats.un.org/unsd/methods/m49/m49.htm"
* ^jurisdiction.coding.code = #001
* ^jurisdiction.coding.display = "World"
* . ^short = "Delivery of bulk Supplies"
* . ^definition = "Record of delivery of what is supplied."
* . ^mustSupport = false
* . ^isModifier = false
* identifier 0..* Identifier "External identifier" "Identifier for the supply delivery event that is used to identify it across multiple disparate systems."
* identifier ^comment = "This identifier is typically assigned by the supplier, and may be used to reference the delivery when exchanging information about it with other systems."
* identifier ^mustSupport = false
* identifier ^isModifier = false
* identifier ^isSummary = false
* basedOn 0..* SU Reference(http://hl7.org/fhir/StructureDefinition/SupplyRequest) "Fulfills plan, proposal or order" "A plan, proposal or order that is fulfilled in whole or in part by this event."
* basedOn ^requirements = "Allows tracing of authorization for the event and tracking whether proposals/recommendations were acted upon."
* basedOn ^mustSupport = false
* basedOn ^isModifier = false
* partOf 0..* SU Reference(http://hl7.org/fhir/StructureDefinition/SupplyDelivery or http://hl7.org/fhir/StructureDefinition/Contract) "Part of referenced event" "A larger event of which this particular event is a component or step."
* partOf ^comment = "Not to be used to link an event to an Encounter - use Event.context for that.\r\r[The allowed reference resources may be adjusted as appropriate for the event resource]."
* partOf ^requirements = "E.g. Drug administration as part of a procedure, procedure as part of observation, etc."
* partOf ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* partOf ^type.extension.valueBoolean = true
* partOf ^mustSupport = false
* partOf ^isModifier = false
* status 0..1 ?! SU code "in-progress | completed | abandoned | entered-in-error" "A code specifying the state of the dispense event."
* status from http://hl7.org/fhir/ValueSet/supplydelivery-status|5.0.0 (required)
* status ^comment = "This element is labeled as a modifier because the status contains codes that mark the resource as not currently valid."
* status ^mustSupport = false
* status ^isModifierReason = "This element is labelled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid"
* status ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* status ^binding.extension.valueString = "SupplyDeliveryStatus"
* status ^binding.description = "Status of the supply delivery."
* patient 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Patient) "Patient for whom the item is supplied" "A link to a resource representing the person whom the delivered item is for."
* patient ^mustSupport = false
* patient ^isModifier = false
* patient ^isSummary = false
* type 0..1 CodeableConcept "Category of supply event" "Indicates the type of supply being provided.  Examples include: Medication, Device, Biologically Derived Product."
* type from http://hl7.org/fhir/ValueSet/supplydelivery-supplyitemtype|5.0.0 (required)
* type ^mustSupport = false
* type ^isModifier = false
* type ^isSummary = false
* type ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type ^binding.extension.valueString = "SupplyDeliverySupplyItemType"
* type ^binding.description = "The type of supply dispense."
* suppliedItem 0..* BackboneElement "The item that is delivered or supplied" "The item that is being delivered or has been supplied."
* suppliedItem ^mustSupport = false
* suppliedItem ^isModifier = false
* suppliedItem ^isSummary = false
* suppliedItem.quantity 0..1 http://hl7.org/fhir/StructureDefinition/SimpleQuantity "Amount supplied" "The amount of the item that has been supplied.  Unit of measure may be included."
* suppliedItem.quantity ^mustSupport = false
* suppliedItem.quantity ^isModifier = false
* suppliedItem.quantity ^isSummary = false
* suppliedItem.item[x] 0..1 CodeableConcept or Reference(http://hl7.org/fhir/StructureDefinition/Medication or http://hl7.org/fhir/StructureDefinition/Substance or http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct or http://hl7.org/fhir/StructureDefinition/NutritionProduct or http://hl7.org/fhir/StructureDefinition/InventoryItem) "Medication, Substance, Device or Biologically Derived Product supplied" "Identifies the medication, substance, device or biologically derived product being supplied. This is either a link to a resource representing the details of the item or a code that identifies the item from a known list."
* suppliedItem.item[x] from http://hl7.org/fhir/ValueSet/supplydelivery-supplyitemtype (example)
* suppliedItem.item[x] ^mustSupport = false
* suppliedItem.item[x] ^isModifier = false
* suppliedItem.item[x] ^isSummary = false
* suppliedItem.item[x] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* suppliedItem.item[x] ^binding.extension.valueString = "SupplyDeliverySupplyItemType"
* suppliedItem.item[x] ^binding.description = "The item that was delivered."
* occurrence[x] 0..1 SU dateTime or Period or Timing "When event occurred" "The date or time(s) the activity occurred."
* occurrence[x] ^comment = "[The list of types may be constrained as appropriate for the type of event]."
* occurrence[x] ^mustSupport = false
* occurrence[x] ^isModifier = false
* supplier 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://hl7.org/fhir/StructureDefinition/Organization) "The item supplier" "The individual or organization responsible for supplying the delivery."
* supplier ^mustSupport = false
* supplier ^isModifier = false
* supplier ^isSummary = false
* destination 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Location) "Where the delivery was sent" "Identification of the facility/location where the delivery was shipped to."
* destination ^mustSupport = false
* destination ^isModifier = false
* destination ^isSummary = false
* receiver 0..* Reference(http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://hl7.org/fhir/StructureDefinition/Organization) "Who received the delivery" "Identifies the individual or organization that received the delivery."
* receiver ^mustSupport = false
* receiver ^isModifier = false
* receiver ^isSummary = false