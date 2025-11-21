Resource: InventoryItem
Id: InventoryItem
Description: "functional description of an inventory item used in inventory and supply-related workflows."
* ^meta.lastUpdated = "2023-03-26T15:21:02.749+11:00"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-category"
* ^extension[=].valueString = "Clinical.Request &amp; Response"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #draft
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 0
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-security-category"
* ^extension[=].valueCode = #business
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #oo
* ^url = "http://hl7.org/fhir/StructureDefinition/InventoryItem"
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
* . ^short = "A functional description of an inventory item used in inventory and supply-related workflows"
* . ^definition = "A functional description of an inventory item used in inventory and supply-related workflows."
* . ^mustSupport = false
* . ^isModifier = false
* identifier 0..* SU Identifier "Business identifier for the inventory item" "Business identifier for the inventory item."
* identifier ^mustSupport = false
* identifier ^isModifier = false
* status 1..1 SU code "active | inactive | entered-in-error | unknown" "Status of the item entry."
* status from http://hl7.org/fhir/ValueSet/inventoryitem-status|5.0.0 (required)
* status ^mustSupport = false
* status ^isModifier = false
* status ^binding.extension[0].url = "http://hl7.org/fhir/tools/StructureDefinition/binding-definition"
* status ^binding.extension[=].valueString = "A coded concept specifying the status of the inventory item."
* status ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* status ^binding.extension[=].valueString = "InventoryItemStatus"
* status ^binding.description = "Status of the inventory item."
* category 0..* SU CodeableConcept "Category or class of the item" "Category or class of the item."
* category ^mustSupport = false
* category ^isModifier = false
* code 0..* SU CodeableConcept "Code designating the specific type of item" "Code designating the specific type of item."
* code ^mustSupport = false
* code ^isModifier = false
* name 0..* SU BackboneElement "The item name(s) - the brand name, or common name, functional name, generic name or others" "The item name(s) - the brand name, or common name, functional name, generic name."
* name ^mustSupport = false
* name ^isModifier = false
* name.nameType 1..1 SU Coding "The type of name e.g. 'brand-name', 'functional-name', 'common-name'" "The type of name e.g. 'brand-name', 'functional-name', 'common-name'."
* name.nameType from http://hl7.org/fhir/ValueSet/inventoryitem-nametype (preferred)
* name.nameType ^mustSupport = false
* name.nameType ^isModifier = false
* name.nameType ^binding.extension[0].url = "http://hl7.org/fhir/tools/StructureDefinition/binding-definition"
* name.nameType ^binding.extension[=].valueString = "The type of name for the item"
* name.nameType ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* name.nameType ^binding.extension[=].valueString = "NameType"
* name.nameType ^binding.description = "Name types."
* name.language 1..1 SU code "The language used to express the item name" "The language that the item name is expressed in."
* name.language from http://hl7.org/fhir/ValueSet/languages|5.0.0 (required)
* name.language ^mustSupport = false
* name.language ^isModifier = false
* name.language ^binding.extension[0].url = "http://hl7.org/fhir/tools/StructureDefinition/binding-definition"
* name.language ^binding.extension[=].valueString = "The languages for an item name"
* name.language ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* name.language ^binding.extension[=].valueString = "NameLanguage"
* name.language ^binding.description = "Name languages."
* name.name 1..1 SU string "The name or designation of the item" "The name or designation that the item is given."
* name.name ^mustSupport = false
* name.name ^isModifier = false
* responsibleOrganization 0..* BackboneElement "Organization(s) responsible for the product" "Organization(s) responsible for the product."
* responsibleOrganization ^mustSupport = false
* responsibleOrganization ^isModifier = false
* responsibleOrganization ^isSummary = false
* responsibleOrganization.role 1..1 CodeableConcept "The role of the organization e.g. manufacturer, distributor, or other" "The role of the organization e.g. manufacturer, distributor, etc."
* responsibleOrganization.role ^mustSupport = false
* responsibleOrganization.role ^isModifier = false
* responsibleOrganization.role ^isSummary = false
* responsibleOrganization.organization 1..1 Reference(http://hl7.org/fhir/StructureDefinition/Organization) "An organization that is associated with the item" "An organization that has an association with the item, e.g. manufacturer, distributor, responsible, etc."
* responsibleOrganization.organization ^mustSupport = false
* responsibleOrganization.organization ^isModifier = false
* responsibleOrganization.organization ^isSummary = false
* description 0..1 BackboneElement "Descriptive characteristics of the item" "The descriptive characteristics of the inventory item."
* description ^mustSupport = false
* description ^isModifier = false
* description ^isSummary = false
* description.language 0..1 code "The language that is used in the item description" "The language for the item description, when an item must be described in different languages and those languages may be authoritative and not translations of a 'main' language."
* description.language from http://hl7.org/fhir/ValueSet/languages|5.0.0 (required)
* description.language ^mustSupport = false
* description.language ^isModifier = false
* description.language ^isSummary = false
* description.language ^binding.extension[0].url = "http://hl7.org/fhir/tools/StructureDefinition/binding-definition"
* description.language ^binding.extension[=].valueString = "The languages for a description of an item"
* description.language ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* description.language ^binding.extension[=].valueString = "ItemDescriptionLanguage"
* description.language ^binding.description = "Description languages."
* description.description 0..1 string "Textual description of the item" "Textual description of the item."
* description.description ^mustSupport = false
* description.description ^isModifier = false
* description.description ^isSummary = false
* inventoryStatus 0..* SU CodeableConcept "The usage status like recalled, in use, discarded" "The usage status e.g. recalled, in use, discarded... This can be used to indicate that the items have been taken out of inventory, or are in use, etc."
* inventoryStatus ^mustSupport = false
* inventoryStatus ^isModifier = false
* baseUnit 0..1 SU CodeableConcept "The base unit of measure - the unit in which the product is used or counted" "The base unit of measure - the unit in which the product is used or counted."
* baseUnit ^mustSupport = false
* baseUnit ^isModifier = false
* netContent 0..1 SU http://hl7.org/fhir/StructureDefinition/SimpleQuantity "Net content or amount present in the item" "Net content or amount present in the item."
* netContent ^mustSupport = false
* netContent ^isModifier = false
* association 0..* BackboneElement "Association with other items or products" "Association with other items or products."
* association ^mustSupport = false
* association ^isModifier = false
* association ^isSummary = false
* association.associationType 1..1 SU CodeableConcept "The type of association between the device and the other item" "This attribute defined the type of association when establishing associations or relations between items, e.g. 'packaged within' or 'used with' or 'to be mixed with."
* association.associationType ^mustSupport = false
* association.associationType ^isModifier = false
* association.relatedItem 1..1 SU Reference(http://hl7.org/fhir/StructureDefinition/InventoryItem or http://hl7.org/fhir/StructureDefinition/Medication or http://hl7.org/fhir/StructureDefinition/MedicationKnowledge or http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/DeviceDefinition or http://hl7.org/fhir/StructureDefinition/NutritionProduct or http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct) "The related item or product" "The related item or product."
* association.relatedItem ^mustSupport = false
* association.relatedItem ^isModifier = false
* association.quantity 1..1 SU Ratio "The quantity of the product in this product" "The quantity of the related product in this product - Numerator is the quantity of the related product. Denominator is the quantity of the present product. For example a value of 20 means that this product contains 20 units of the related product; a value of 1:20 means the inverse - that the contained product contains 20 units of the present product."
* association.quantity ^mustSupport = false
* association.quantity ^isModifier = false
* characteristic 0..* BackboneElement "Characteristic of the item" "The descriptive or identifying characteristics of the item."
* characteristic ^mustSupport = false
* characteristic ^isModifier = false
* characteristic ^isSummary = false
* characteristic.characteristicType 1..1 CodeableConcept "The characteristic that is being defined" "The type of characteristic that is being defined."
* characteristic.characteristicType ^mustSupport = false
* characteristic.characteristicType ^isModifier = false
* characteristic.characteristicType ^isSummary = false
* characteristic.value[x] 1..1 string or integer or decimal or boolean or url or dateTime or Quantity or Range or Ratio or Annotation or Address or Duration or CodeableConcept "The value of the attribute" "The value of the attribute."
* characteristic.value[x] ^comment = "The string value is used for characteristics that are descriptive and not codeable information. CodeableConcept.text is used when the characteristic is discrete and could otherwise be coded but for which there is no code available."
* characteristic.value[x] ^mustSupport = false
* characteristic.value[x] ^isModifier = false
* characteristic.value[x] ^isSummary = false
* instance 0..1 BackboneElement "Instances or occurrences of the product" "Instances or occurrences of the product."
* instance ^mustSupport = false
* instance ^isModifier = false
* instance ^isSummary = false
* instance.identifier 0..* Identifier "The identifier for the physical instance, typically a serial number" "The identifier for the physical instance, typically a serial number."
* instance.identifier ^mustSupport = false
* instance.identifier ^isModifier = false
* instance.identifier ^isSummary = false
* instance.lotNumber 0..1 string "The lot or batch number of the item" "The lot or batch number of the item."
* instance.lotNumber ^mustSupport = false
* instance.lotNumber ^isModifier = false
* instance.lotNumber ^isSummary = false
* instance.expiry 0..1 dateTime "The expiry date or date and time for the product" "The expiry date or date and time for the product."
* instance.expiry ^mustSupport = false
* instance.expiry ^isModifier = false
* instance.expiry ^isSummary = false
* instance.subject 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/Organization) "The subject that the item is associated with" "The subject that the item is associated with."
* instance.subject ^mustSupport = false
* instance.subject ^isModifier = false
* instance.subject ^isSummary = false
* instance.location 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Location) "The location that the item is associated with" "The location that the item is associated with."
* instance.location ^mustSupport = false
* instance.location ^isModifier = false
* instance.location ^isSummary = false
* productReference 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Medication or http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/NutritionProduct or http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct) "Link to a product resource used in clinical workflows" "Link to a product resource used in clinical workflows."
* productReference ^mustSupport = false
* productReference ^isModifier = false
* productReference ^isSummary = false