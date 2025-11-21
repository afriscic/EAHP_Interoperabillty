Resource: Task
Id: Task
Description: "A task to be performed."
* ^meta.lastUpdated = "2023-03-26T15:21:02.749+11:00"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-category"
* ^extension[=].valueString = "Base.Workflow"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #trial-use
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 3
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-security-category"
* ^extension[=].valueCode = #not-classified
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #oo
* ^url = "http://hl7.org/fhir/StructureDefinition/Task"
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
* obeys tsk-1
* . ^short = "A task to be performed"
* . ^definition = "A task to be performed."
* . ^constraint[5].key = "inv-1"
* . ^constraint[=].severity = #error
* . ^constraint[=].human = "Last modified date must be greater than or equal to authored-on date."
* . ^constraint[=].expression = "lastModified.exists().not() or authoredOn.exists().not() or lastModified >= authoredOn"
* . ^constraint[=].source = "http://hl7.org/fhir/StructureDefinition/Task"
* . ^mustSupport = false
* . ^isModifier = false
* identifier 0..* Identifier "Task Instance Identifier" "The business identifier for this task."
* identifier ^mustSupport = false
* identifier ^isModifier = false
* identifier ^isSummary = false
* instantiatesCanonical 0..1 SU Canonical(http://hl7.org/fhir/StructureDefinition/ActivityDefinition) "Formal definition of task" "The URL pointing to a *FHIR*-defined protocol, guideline, orderset or other definition that is adhered to in whole or in part by this Task."
* instantiatesCanonical ^requirements = "Enables a formal definition of how the task is to be performed, enabling automation."
* instantiatesCanonical ^mustSupport = false
* instantiatesCanonical ^isModifier = false
* instantiatesUri 0..1 SU uri "Formal definition of task" "The URL pointing to an *externally* maintained  protocol, guideline, orderset or other definition that is adhered to in whole or in part by this Task."
* instantiatesUri ^requirements = "Enables a formal definition of how the task is to be performed (e.g. using BPMN, BPEL, XPDL or other formal notation to be associated with a task), enabling automation."
* instantiatesUri ^mustSupport = false
* instantiatesUri ^isModifier = false
* basedOn 0..* SU Reference(http://hl7.org/fhir/StructureDefinition/Resource) "Request fulfilled by this task" "BasedOn refers to a higher-level authorization that triggered the creation of the task.  It references a \"request\" resource such as a ServiceRequest, MedicationRequest, CarePlan, etc. which is distinct from the \"request\" resource the task is seeking to fulfill.  This latter resource is referenced by focus.  For example, based on a CarePlan (= basedOn), a task is created to fulfill a ServiceRequest ( = focus ) to collect a specimen from a patient."
* basedOn ^comment = "Task.basedOn is never the same as Task.focus.  Task.basedOn will typically not be present for 'please fulfill' Tasks as a distinct authorization is rarely needed to request fulfillment.  If the Task is seeking fulfillment of an order, the order to be fulfilled is always communicated using `focus`, never basedOn.  However, authorization may be needed to perform other types of Task actions.  As an example of when both would be present, a Task seeking suspension of a prescription might have a Task.basedOn pointing to the ServiceRequest ordering surgery (which is the driver for suspending the MedicationRequest - which would be the Task.focus)."
* basedOn ^mustSupport = false
* basedOn ^isModifier = false
* groupIdentifier 0..1 SU Identifier "Requisition or grouper id" "A shared identifier common to multiple independent Task and Request instances that were activated/authorized more or less simultaneously by a single author.  The presence of the same identifier on each request ties those requests together and may have business ramifications in terms of reporting of results, billing, etc.  E.g. a requisition number shared by a set of lab tests ordered together, or a prescription number shared by all meds ordered at one time."
* groupIdentifier ^requirements = "Billing and/or reporting can be linked to whether multiple requests were created as a single unit."
* groupIdentifier ^mustSupport = false
* groupIdentifier ^isModifier = false
* partOf 0..* SU Reference(http://hl7.org/fhir/StructureDefinition/Task) "Composite task" "Task that this particular task is part of."
* partOf ^comment = "This should usually be 0..1."
* partOf ^requirements = "Allows tasks to be broken down into sub-steps (and this division can occur independent of the original task)."
* partOf ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* partOf ^type.extension.valueBoolean = true
* partOf ^mustSupport = false
* partOf ^isModifier = false
* status 1..1 ?! SU code "draft | requested | received | accepted | +" "The current status of the task."
* status from http://hl7.org/fhir/ValueSet/task-status|5.0.0 (required)
* status ^requirements = "These states enable coordination of task status with off-the-shelf workflow solutions that support automation of tasks."
* status ^mustSupport = false
* status ^isModifierReason = "This element is labeled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid"
* status ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* status ^binding.extension[=].valueString = "TaskStatus"
* status ^binding.description = "The current status of the task."
* statusReason 0..1 SU CodeableReference "Reason for current status" "An explanation as to why this task is held, failed, was refused, etc."
* statusReason from http://hl7.org/fhir/ValueSet/task-status-reason (example)
* statusReason ^comment = "This applies to the current status.  Look at the history of the task to see reasons for past statuses."
* statusReason ^mustSupport = false
* statusReason ^isModifier = false
* statusReason ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* statusReason ^binding.extension[=].valueString = "TaskStatusReason"
* statusReason ^binding.description = "Codes to identify the reason for current status.  These will typically be specific to a particular workflow."
* businessStatus 0..1 SU CodeableConcept "E.g. \"Specimen collected\", \"IV prepped\"" "Contains business-specific nuances of the business state."
* businessStatus ^requirements = "There's often a need to track substates of a task - this is often variable by specific workflow implementation."
* businessStatus ^mustSupport = false
* businessStatus ^isModifier = false
* businessStatus ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* businessStatus ^binding.extension[=].valueString = "TaskBusinessStatus"
* businessStatus ^binding.strength = #example
* businessStatus ^binding.description = "The domain-specific business-contextual sub-state of the task.  For example: \"Blood drawn\", \"IV inserted\", \"Awaiting physician signature\", etc."
* intent 1..1 SU code "unknown | proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option" "Indicates the \"level\" of actionability associated with the Task, i.e. i+R[9]Cs this a proposed task, a planned task, an actionable task, etc."
* intent from http://hl7.org/fhir/ValueSet/task-intent|5.0.0 (required)
* intent ^comment = "This element is immutable.  Proposed tasks, planned tasks, etc. must be distinct instances.\n\nIn most cases, Tasks will have an intent of \"order\"."
* intent ^mustSupport = false
* intent ^isModifier = false
* intent ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* intent ^binding.extension[=].valueString = "TaskIntent"
* intent ^binding.description = "Distinguishes whether the task is a proposal, plan or full order."
* priority 0..1 code "routine | urgent | asap | stat" "Indicates how quickly the Task should be addressed with respect to other requests."
* priority from http://hl7.org/fhir/ValueSet/request-priority|5.0.0 (required)
* priority ^requirements = "Used to identify the service level expected while performing a task."
* priority ^meaningWhenMissing = "If missing, this task should be performed with normal priority"
* priority ^mustSupport = false
* priority ^isModifier = false
* priority ^isSummary = false
* priority ^binding.extension[0].url = "http://hl7.org/fhir/tools/StructureDefinition/binding-definition"
* priority ^binding.extension[=].valueString = "The task's priority."
* priority ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* priority ^binding.extension[=].valueString = "TaskPriority"
* priority ^binding.description = "The priority of a task (may affect service level applied to the task)."
* doNotPerform 0..1 ?! SU boolean "True if Task is prohibiting action" "If true indicates that the Task is asking for the specified action to *not* occur."
* doNotPerform ^comment = "The attributes provided with the Task qualify what is not to be done. For example, if a requestedPeriod is provided, the 'do not' request only applies within the specified time. If a requestedPerformer is specified then the 'do not' request only applies to performers of that type. Qualifiers include: code, subject, occurrence, requestedPerformer and performer.\n\nIn some cases, the Request.code may pre-coordinate prohibition into the requested action. E.g. 'NPO' (nothing by mouth), 'DNR' (do not recussitate). If this happens, doNotPerform SHALL NOT be set to true. I.e. The resource shall not have double negation. (E.g. 'Do not DNR').\n\ndoNotPerform should ONLY be used with Tasks that are tightly bounded in time or process phase.  E.g. 'Do not fulfill the midnight dose of medication X tonight due to the early morning scheduled procedure, where the nurse could reasonably check off 'Med X not given at midnight as instructed'.  Similarly, a decision support proposal that a patient should not be given a standard intake questionnaire (because the patient is cognitively impaired) would be marked as 'complete' or 'rejected' when the clinician preps the CarePlan or order set after reviewing the decision support results.  If there is a need to create a standing order to not do something that can't be satisfied by a single 'non-action', but rather an ongoing refusal to perform the function, MedicationRequest, ServiceRequest or some other form of authorization should be used."
* doNotPerform ^mustSupport = false
* doNotPerform ^isModifierReason = "If true, this element negates the Task. For example, instead of a request to perform a task, it is a request _not_ to perform a task."
* code 0..1 SU CodeableConcept "Task Type" "A name or code (or both) briefly describing what the task involves."
* code from http://hl7.org/fhir/ValueSet/task-code (example)
* code ^comment = "The title (eg \"My Tasks\", \"Outstanding Tasks for Patient X\") should go into the code."
* code ^condition = "tsk-1"
* code ^mustSupport = false
* code ^isModifier = false
* code ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code ^binding.extension[=].valueString = "TaskCode"
* code ^binding.description = "Codes to identify what the task involves.  These will typically be specific to a particular workflow."
* description 0..1 SU string "Human-readable explanation of task" "A free-text description of what is to be performed."
* description ^mustSupport = false
* description ^isModifier = false
* focus 0..1 SU Reference(http://hl7.org/fhir/StructureDefinition/Resource) "What task is acting on" "The request being fulfilled or the resource being manipulated (changed, suspended, etc.) by this task."
* focus ^comment = "If multiple resources need to be manipulated, use sub-tasks.  (This ensures that status can be tracked independently for each referenced resource.)."
* focus ^requirements = "Used to identify the thing to be done."
* focus ^condition = "tsk-1"
* focus ^mustSupport = false
* focus ^isModifier = false
* for 0..1 SU Reference(http://hl7.org/fhir/StructureDefinition/Resource) "Beneficiary of the Task" "The entity who benefits from the performance of the service specified in the task (e.g., the patient)."
* for ^requirements = "Used to track tasks outstanding for a beneficiary.  Do not use to track the task owner or creator (see owner and creator respectively).  This can also affect access control."
* for ^alias[0] = "Patient"
* for ^mustSupport = false
* for ^isModifier = false
* encounter 0..1 SU Reference(http://hl7.org/fhir/StructureDefinition/Encounter) "Healthcare event during which this task originated" "The healthcare event  (e.g. a patient and healthcare provider interaction) during which this task was created."
* encounter ^requirements = "For some tasks it may be important to know the link between the encounter the task originated within."
* encounter ^mustSupport = false
* encounter ^isModifier = false
* requestedPeriod 0..1 SU Period "When the task should be performed" "Indicates the start and/or end of the period of time when completion of the task is desired to take place."
* requestedPeriod ^comment = "This is typically used when the Task is *not* seeking fulfillment of a focus Request, as in that case the period would be specified on the Request and/or in the Task.restriction.period.  Instead, it is used for stand-alone tasks."
* requestedPeriod ^mustSupport = false
* requestedPeriod ^isModifier = false
* executionPeriod 0..1 SU Period "Start and end time of execution" "Identifies the time action was first taken against the task (start) and/or the time final action was taken against the task prior to marking it as completed (end)."
* executionPeriod ^mustSupport = false
* executionPeriod ^isModifier = false
* authoredOn 0..1 dateTime "Task Creation Date" "The date and time this task was created."
* authoredOn ^requirements = "Most often used along with lastUpdated to track duration of task to supporting monitoring and management."
* authoredOn ^alias[0] = "Created Date"
* authoredOn ^condition = "inv-1"
* authoredOn ^mustSupport = false
* authoredOn ^isModifier = false
* authoredOn ^isSummary = false
* lastModified 0..1 SU dateTime "Task Last Modified Date" "The date and time of last modification to this task."
* lastModified ^requirements = "Used along with history to track task activity and time in a particular task state.  This enables monitoring and management."
* lastModified ^alias[0] = "Update Date"
* lastModified ^condition = "inv-1"
* lastModified ^mustSupport = false
* lastModified ^isModifier = false
* requester 0..1 SU Reference(http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://hl7.org/fhir/StructureDefinition/RelatedPerson) "Who is asking for task to be done" "The creator of the task."
* requester ^requirements = "Identifies who created this task.  May be used by access control mechanisms (e.g., to ensure that only the creator can cancel a task)."
* requester ^mustSupport = false
* requester ^isModifier = false
* requestedPerformer 0..* CodeableReference(http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/CareTeam or http://hl7.org/fhir/StructureDefinition/HealthcareService or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/Device or http://hl7.org/fhir/StructureDefinition/RelatedPerson) "Who should perform Task" "The kind of participant or specific participant that should perform the task."
* requestedPerformer from http://hl7.org/fhir/ValueSet/performer-role (preferred)
* requestedPerformer ^requirements = "Use to distinguish tasks on different activity queues."
* requestedPerformer ^mustSupport = false
* requestedPerformer ^isModifier = false
* requestedPerformer ^isSummary = false
* requestedPerformer ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* requestedPerformer ^binding.extension[=].valueString = "TaskPerformerType"
* requestedPerformer ^binding.description = "The type(s) of task performers allowed."
* owner 0..1 SU Reference(http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/CareTeam or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/RelatedPerson) "Responsible individual" "Party responsible for managing task execution."
* owner ^comment = "Tasks may be created with an owner not yet identified."
* owner ^requirements = "Identifies who is expected to perform this task."
* owner ^alias[0] = "Performer"
* owner ^alias[+] = "Executer"
* owner ^mustSupport = false
* owner ^isModifier = false
* performer 0..* SU BackboneElement "Who or what performed the task" "The entity who performed the requested task."
* performer ^mustSupport = false
* performer ^isModifier = false
* performer.function 0..1 SU CodeableConcept "Type of performance" "A code or description of the performer of the task."
* performer.function ^mustSupport = false
* performer.function ^isModifier = false
* performer.function ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* performer.function ^binding.extension[=].valueString = "TaskPerformerFunctionCode"
* performer.function ^binding.strength = #example
* performer.function ^binding.description = "Codes to identify types of task performers."
* performer.actor 1..1 SU Reference(http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://hl7.org/fhir/StructureDefinition/Organization or http://hl7.org/fhir/StructureDefinition/CareTeam or http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/RelatedPerson) "Who performed the task" "The actor or entity who performed the task."
* performer.actor ^mustSupport = false
* performer.actor ^isModifier = false
* location 0..1 SU Reference(http://hl7.org/fhir/StructureDefinition/Location) "Where task occurs" "Principal physical location where this task is performed."
* location ^comment = "This should only be specified when the Task to be/being performed happens or is expected to happen primarily within the bounds of a single Location.  Other locations (e.g. source, destination, etc.) would either be reflected on the 'basedOn' Request or be conveyed as distinct Task.input values."
* location ^requirements = "Ties the event to where the records are likely kept and provides context around the event occurrence (e.g. if it occurred inside or outside a dedicated healthcare setting)."
* location ^mustSupport = false
* location ^isModifier = false
* reason 0..* CodeableReference "Why task is needed" "A description, code, or reference indicating why this task needs to be performed."
* reason ^comment = "This will typically not be present for Tasks with a code of 'please fulfill' as, for those, the reason for action is conveyed on the Request pointed to by Task.focus.  Some types of tasks will not need a 'reason'.  E.g. a request to discharge a patient can be inferred to be 'because the patient is ready' and this would not need a reason to be stated on the Task."
* reason ^mustSupport = false
* reason ^isModifier = false
* reason ^isSummary = false
* reason ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* reason ^binding.extension[=].valueString = "TaskReason"
* reason ^binding.strength = #example
* reason ^binding.description = "Indicates why the task is needed.  E.g. Suspended because patient admitted to hospital."
* insurance 0..* Reference(http://hl7.org/fhir/StructureDefinition/Coverage or http://hl7.org/fhir/StructureDefinition/ClaimResponse) "Associated insurance coverage" "Insurance plans, coverage extensions, pre-authorizations and/or pre-determinations that may be relevant to the Task."
* insurance ^mustSupport = false
* insurance ^isModifier = false
* insurance ^isSummary = false
* note 0..* Annotation "Comments made about the task" "Free-text information captured about the task as it progresses."
* note ^mustSupport = false
* note ^isModifier = false
* note ^isSummary = false
* relevantHistory 0..* Reference(http://hl7.org/fhir/StructureDefinition/Provenance) "Key events in history of the Task" "Links to Provenance records for past versions of this Task that identify key state transitions or updates that are likely to be relevant to a user looking at the current version of the task."
* relevantHistory ^comment = "This element does not point to the Provenance associated with the *current* version of the resource - as it would be created after this version existed.  The Provenance for the current version can be retrieved with a _revinclude."
* relevantHistory ^alias[0] = "Status History"
* relevantHistory ^mustSupport = false
* relevantHistory ^isModifier = false
* relevantHistory ^isSummary = false
* restriction 0..1 BackboneElement "Constraints on fulfillment tasks" "If the Task.focus is a request resource and the task is seeking fulfillment (i.e. is asking for the request to be actioned), this element identifies any limitations on what parts of the referenced request should be actioned."
* restriction ^comment = "Task.restriction can only be present if the Task is seeking fulfillment of another Request resource, and the restriction identifies what subset of the authorization conveyed by the request is supposed to be fulfilled by this Task. A possible example could be a standing order (the request) covering a significant time period and/or individuals, while the Task seeks fulfillment for only a subset of that time-period and a single individual."
* restriction ^requirements = "Sometimes when fulfillment is sought, you don't want full fulfillment."
* restriction ^condition = "tsk-1"
* restriction ^mustSupport = false
* restriction ^isModifier = false
* restriction ^isSummary = false
* restriction.repetitions 0..1 positiveInt "How many times to repeat" "Indicates the number of times the requested action should occur."
* restriction.repetitions ^requirements = "E.g. order that requests monthly lab tests, fulfillment is sought for 1."
* restriction.repetitions ^mustSupport = false
* restriction.repetitions ^isModifier = false
* restriction.repetitions ^isSummary = false
* restriction.period 0..1 Period "When fulfillment is sought" "The time-period for which fulfillment is sought. This must fall within the overall time period authorized in the referenced request.  E.g. ServiceRequest.occurance[x]."
* restriction.period ^comment = "This is distinct from Task.executionPeriod. ExecutionPeriod indicates when the task needs to be initiated, while Task.restriction.period specifies the subset of the overall authorization that this period covers. For example, a MedicationRequest with an overall effective period of 1 year might have a Task whose restriction.period is 2 months (i.e. satisfy 2 months of medication therapy), while the execution period might be 'between now and 5 days from now' - i.e. If you say yes to this, then you're agreeing to supply medication for that 2 month period within the next 5 days.\n\nNote that period.high is the due date representing the time by which the task should be completed."
* restriction.period ^requirements = "E.g. order that authorizes 1 year's services.  Fulfillment is sought for next 3 months."
* restriction.period ^mustSupport = false
* restriction.period ^isModifier = false
* restriction.period ^isSummary = false
* restriction.recipient 0..* Reference(http://hl7.org/fhir/StructureDefinition/Patient or http://hl7.org/fhir/StructureDefinition/Practitioner or http://hl7.org/fhir/StructureDefinition/PractitionerRole or http://hl7.org/fhir/StructureDefinition/RelatedPerson or http://hl7.org/fhir/StructureDefinition/Group or http://hl7.org/fhir/StructureDefinition/Organization) "For whom is fulfillment sought?" "For requests that are targeted to more than one potential recipient/target, to identify who is fulfillment is sought for."
* restriction.recipient ^mustSupport = false
* restriction.recipient ^isModifier = false
* restriction.recipient ^isSummary = false
* input 0..* BackboneElement "Information used to perform task" "Additional information that may be needed in the execution of the task."
* input ^requirements = "Resources and data used to perform the task.  This data is used in the business logic of task execution, and is stored separately because it varies between workflows."
* input ^alias[0] = "Supporting Information"
* input ^mustSupport = false
* input ^isModifier = false
* input ^isSummary = false
* input.type 1..1 CodeableConcept "Label for the input" "A code or description indicating how the input is intended to be used as part of the task execution."
* input.type ^comment = "If referencing a BPMN workflow or Protocol, the \"system\" is the URL for the workflow definition and the code is the \"name\" of the required input."
* input.type ^requirements = "Inputs are named to enable task automation to bind data and pass it from one task to the next."
* input.type ^alias[0] = "Name"
* input.type ^mustSupport = false
* input.type ^isModifier = false
* input.type ^isSummary = false
* input.type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* input.type ^binding.extension[=].valueString = "TaskInputParameterType"
* input.type ^binding.strength = #example
* input.type ^binding.description = "Codes to identify types of input parameters.  These will typically be specific to a particular workflow.  E.g. \"Comparison source\", \"Applicable consent\", \"Concomitent Medications\", etc."
* input.value[x] 1..1 base64Binary or boolean or canonical or code or date or dateTime or decimal or id or instant or integer or integer64 or markdown or oid or positiveInt or string or time or unsignedInt or uri or url or uuid or Address or Age or Annotation or Attachment or CodeableConcept or CodeableReference or Coding or ContactPoint or Count or Distance or Duration or HumanName or Identifier or Money or Period or Quantity or Range or Ratio or RatioRange or Reference or SampledData or Signature or Timing or ContactDetail or DataRequirement or Expression or ParameterDefinition or RelatedArtifact or TriggerDefinition or UsageContext or Availability or ExtendedContactDetail or Dosage or Meta "Content to use in performing the task" "The value of the input parameter as a basic type."
* input.value[x] ^mustSupport = false
* input.value[x] ^isModifier = false
* input.value[x] ^isSummary = false
* output 0..* BackboneElement "Information produced as part of task" "Outputs produced by the Task."
* output ^requirements = "Resources and data produced during the execution the task.  This data is generated by the business logic of task execution, and is stored separately because it varies between workflows."
* output ^mustSupport = false
* output ^isModifier = false
* output ^isSummary = false
* output.type 1..1 CodeableConcept "Label for output" "The name of the Output parameter."
* output.type ^requirements = "Outputs are named to enable task automation to bind data and pass it from one task to the next."
* output.type ^alias[0] = "Name"
* output.type ^mustSupport = false
* output.type ^isModifier = false
* output.type ^isSummary = false
* output.type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* output.type ^binding.extension[=].valueString = "TaskOutputParameterType"
* output.type ^binding.strength = #example
* output.type ^binding.description = "Codes to identify types of input parameters.  These will typically be specific to a particular workflow.  E.g. \"Identified issues\", \"Preliminary results\", \"Filler order\", \"Final results\", etc."
* output.value[x] 1..1 base64Binary or boolean or canonical or code or date or dateTime or decimal or id or instant or integer or integer64 or markdown or oid or positiveInt or string or time or unsignedInt or uri or url or uuid or Address or Age or Annotation or Attachment or CodeableConcept or CodeableReference or Coding or ContactPoint or Count or Distance or Duration or HumanName or Identifier or Money or Period or Quantity or Range or Ratio or RatioRange or Reference or SampledData or Signature or Timing or ContactDetail or DataRequirement or Expression or ParameterDefinition or RelatedArtifact or TriggerDefinition or UsageContext or Availability or ExtendedContactDetail or Dosage or Meta "Result of output" "The value of the Output parameter as a basic type."
* output.value[x] ^requirements = "Task outputs can take any form."
* output.value[x] ^mustSupport = false
* output.value[x] ^isModifier = false
* output.value[x] ^isSummary = false