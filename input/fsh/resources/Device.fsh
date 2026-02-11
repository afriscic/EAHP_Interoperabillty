Profile: DeviceEAHPInteroperability
Title: "Device EAHP Interoperability"
Parent: Device
Description: "Device profile for EAHP Interoperability SIG. Represents automation actors (Whole Pack Robots, Compounding Robots, Smart Cabinets, Unidose Robots etc) capable of requesting or supplying medicines."

* ^status = #active
* ^publisher = "EAHP Interoperability SIG"

// 1. Identification
* identifier 1..* MS
* identifier ^short = "Serial number or internal asset ID"

* name 1..* MS
* name.value 1..1
* name.type 1..1
* name.type = #user-friendly-name // Suggesting a default type

* type 1..* MS
* type from EAHPMedicineHandlingAutomationVS
* type ^short = "The kind of automation"

* location 1..1 MS
* location only Reference(Location)
* location ^short = "The physical location where this device operates"


CodeSystem: EAHPMedicineHandlingAutomationTypes
Id: eahp-medicine-handling-automation-types
Title: "EAHP Medicine Handling Automation Types"
Description: "CodeSystem defining specific types of medicine handling automation for EAHP interoperability."
* #WholePackRobot "Whole Pack Robot" "An automation system handling whole packs, often located in central pharmacies for high-volume storage and retrieval."
* #AutomatedDispensingCabinet "Automated Dispensing Cabinet" "A decentralized automation unit used to supply unit doses or whole packs, typically located in wards, ICUs, or near surgery rooms."
* #UniDoseRobot "UniDose Robot" "An automation system that de-blisters or takes bulk items, singularizes them, and packages them (e.g., into rings or strips) for patient-specific administration."
* #CompoundingRobot "Compounding Robot" "A robot designed to automatically prepare compound medications, such as IV therapy bags or chemotherapy."
* #SmartCart "Smart Cart" "A mobile cart equipped with electronic locking or tracking to store and transport patient-specific administrations."

ValueSet: EAHPMedicineHandlingAutomationVS
Id: eahp-medicine-handling-automation-vs
Title: "EAHP Medicine Handling Automation Value Set"
Description: "Value set containing codes for EAHP medicine handling automation types."
* include codes from system EAHPMedicineHandlingAutomationTypes