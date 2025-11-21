Resource: SupplyRequest
Id: SupplyRequest
Description: "A record of a non-patient specific request for a medication, substance, device, certain types of biologically derived product, and nutrition product used in the healthcare setting."
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
* ^url = "http://hl7.org/fhir/StructureDefinition/SupplyRequest"
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
* . ^short = "Request for a medication, substance or device"
* . ^definition = "A record of a request to deliver a medication, substance or device used in the healthcare setting to a particular destination for a particular person or organization."
* . ^mustSupport = false
* . ^isModifier = false
* identifier 0..* SU Identifier "Business Identifier for SupplyRequest" "Business identifiers assigned to this SupplyRequest by the author and/or other systems. These identifiers remain constant as the resource is updated and propagates from server to server."
* identifier ^comment = "The identifier.type element is used to distinguish between the identifiers assigned by the requester/placer and the performer/filler."
* identifier ^requirements = "Allows identification of the request as it is known by various participating systems and in a way that remains consistent across servers."
* identifier ^mustSupport = false
* identifier ^isModifier = false
* status 0..1 ?! SU code "draft | active | suspended +" "Status of the supply request."
* status from http://hl7.org/fhir/ValueSet/supplyrequest-status|5.0.0 (required)
* status ^mustSupport = false
* status ^isModifierReason = "This element is labeled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid"
* status ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* status ^binding.extension.valueString = "SupplyRequestStatus"
* status ^binding.description = "Status of the supply request."
* basedOn 0..* SU Reference(http://hl7.org/fhir/StructureDefinition/Resource) "What other request is fulfilled by this supply request" "Plan/proposal/order fulfilled by this request."
* basedOn ^mustSupport = false
* basedOn ^isModifier = false
* category 0..1 SU CodeableConcept "The kind of supply (central, non-stock, etc.)" "Category of supply, e.g.  central, non-stock, etc. This is used to support work flows associated with the supply process."
* category from http://hl7.org/fhir/ValueSet/supplyrequest-kind (example)
* category ^alias[0] = "kind"
* category ^mustSupport = false
* category ^isModifier = false
* category ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* category ^binding.extension.valueString = "SupplyRequestKind"
* category ^binding.description = "Category of supply request."
* priority 0..1 SU code "routine | urgent | asap | stat" "Indicates how quickly this SupplyRequest should be addressed with respect to other requests."
* priority from http://hl7.org/fhir/ValueSet/request-priority|5.0.0 (required)
* priority ^meaningWhenMissing = "If missing, this task should be performed with normal priority"
* priority ^mustSupport = false
* priority ^isModifier = false
* priority ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* priority ^binding.extension.valueString = "RequestPriority"
* priority ^binding.description = "Identifies the level of importance to be assigned to actioning the request."
* deliverFor 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Patient) "The patient for who the supply request is for" "The patient to whom the supply will be given or for whom they will be used."
* deliverFor ^alias[0] = "subject"
* deliverFor ^mustSupport = false
* deliverFor ^isModifier = false
* deliverFor ^isSummary = false
* item 1..1 SU CodeableReference(http://hl7.org/fhir/StructureDefinition/Medication or http://hl7.org/fhir/StructureDefinition/Substance or http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/DeviceDefinition or http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct or http://hl7.org/fhir/StructureDefinition/NutritionProduct or http://hl7.org/fhir/StructureDefinition/InventoryItem) "Medication, Substance, or Device requested to be supplied" "The item that is requested to be supplied. This is either a link to a resource representing the details of the item or a code that identifies the item from a known list."
* item from http://hl7.org/fhir/ValueSet/supply-item (example)
* item ^comment = "Note that there's a difference between a prescription - an instruction to take a medication, along with a (sometimes) implicit supply, and an explicit request to supply, with no explicit instructions."
* item ^mustSupport = false
* item ^isModifier = false
* item ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* item ^binding.extension.valueString = "SupplyRequestItem"
* item ^binding.description = "The item that was requested."
* quantity 1..1 SU Quantity "The requested amount of the item indicated" "The amount that is being ordered of the indicated item."
* quantity ^mustSupport = false
* quantity ^isModifier = false
* parameter 0..* BackboneElement "Ordered item details" "Specific parameters for the ordered item.  For example, the size of the indicated item."
* parameter ^mustSupport = false
* parameter ^isModifier = false
* parameter ^isSummary = false
* parameter.code 0..1 CodeableConcept "Item detail" "A code or string that identifies the device detail being asserted."
* parameter.code ^mustSupport = false
* parameter.code ^isModifier = false
* parameter.code ^isSummary = false
* parameter.code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* parameter.code ^binding.extension.valueString = "ParameterCode"
* parameter.code ^binding.strength = #example
* parameter.code ^binding.description = "A code that identifies the device detail."
* parameter.value[x] 0..1 CodeableConcept or Quantity or Range or boolean "Value of detail" "The value of the device detail."
* parameter.value[x] ^comment = "Range means device should have a value that falls somewhere within the specified range."
* parameter.value[x] ^mustSupport = false
* parameter.value[x] ^isModifier = false
* parameter.value[x] ^isSummary = false
* occurrence[x] 0..1 SU dateTime or Period or Timing "When the request should be fulfilled" "When the request should be fulfilled."
* occurrence[x] ^alias[0] = "when"
* occurrence[x] ^alias[+] = "timing"
* occurrence[x] ^mustSupport = false
* occurrence[x] ^isModifier = false
* authoredOn 0..1 SU dateTime "When the request was made" "When the request was made."
* authoredOn ^alias[0] = "date"
* authoredOn ^alias[+] = "createdOn"
* authoredOn ^alias[+] = "signedOn"
* authoredOn ^mustSupport = false
* authoredOn ^isModifier = false
* requester 0..1 SU Reference(http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/CareTeam) "Individual making the request" "The device, practitioner, etc. who initiated the request."
* requester ^alias[0] = "author"
* requester ^alias[+] = "source"
* requester ^mustSupport = false
* requester ^isModifier = false
* supplier 0..* SU Reference(http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/HealthcareService) "Who is intended to fulfill the request" "Who is intended to fulfill the request."
* supplier ^alias[0] = "performer"
* supplier ^mustSupport = false
* supplier ^isModifier = false
* reason 0..* CodeableReference(http://hl7.org/fhir/StructureDefinition/Condition or http://hl7.org/fhir/StructureDefinition/Observation or http://hl7.org/fhir/StructureDefinition/DiagnosticReport or http://hl7.org/fhir/StructureDefinition/DocumentReference) "The reason why the supply item was requested" "The reason why the supply item was requested."
* reason from http://hl7.org/fhir/ValueSet/supplyrequest-reason (example)
* reason ^mustSupport = false
* reason ^isModifier = false
* reason ^isSummary = false
* reason ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* reason ^binding.extension.valueString = "SupplyRequestReason"
* reason ^binding.description = "The reason why the supply item was requested."
* deliverFrom 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/Location) "The origin of the supply" "Where the supply is expected to come from."
* deliverFrom ^mustSupport = false
* deliverFrom ^isModifier = false
* deliverFrom ^isSummary = false
* deliverTo 0..1 Reference(http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/Location or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/RelatedPerson) "The destination of the supply" "Where the supply is destined to go."
* deliverTo ^mustSupport = false
* deliverTo ^isModifier = false
* deliverTo ^isSummary = false