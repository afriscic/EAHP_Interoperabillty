// -----------------------------------------------------------------------------
// 1. PARENT LOCATIONS (The Rooms/Wards)
// -----------------------------------------------------------------------------

Instance: loc-pharmacy-central-room
InstanceOf: Location
Usage: #example
Title: "Location - Central Pharmacy Room"
Description: "The physical room containing the central pharmacy operations."
* status = #active
* name = "Central Pharmacy Room"
* mode = #instance
// Physical Type: Room
* form = http://terminology.hl7.org/CodeSystem/location-physical-type#ro "Room"
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#PHARM "Pharmacy"


Instance: loc-ward-cardio
InstanceOf: Location
Usage: #example
Title: "Location - Cardiology Ward"
Description: "The Cardiology Ward (North Wing) where patients are admitted."
* status = #active
* name = "Cardiology Ward North"
* mode = #instance
// Physical Type: Ward
* form = http://terminology.hl7.org/CodeSystem/location-physical-type#wa "Ward"
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#CARD "Cardiology clinic"


// -----------------------------------------------------------------------------
// 2. EQUIPMENT LOCATIONS (The Machines)
// -----------------------------------------------------------------------------

Instance: loc-robot-main
InstanceOf: Location
Usage: #example
Title: "Location - Central Pharmacy Robot"
Description: "A Whole Pack Robot located in the Central Pharmacy acting as a storage location."
* status = #active
* name = "Main Pharmacy Whole Pack Robot 01"
* description = "Primary robotic storage for whole packs in Central Pharmacy"
* mode = #instance
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#PHARM "Pharmacy"
* form = http://terminology.hl7.org/CodeSystem/location-physical-type#ca "Cabinet"
* partOf = Reference(loc-pharmacy-central-room)


Instance: loc-adc-cardio-01
InstanceOf: Location
Usage: #example
Title: "Location - Cardiology Ward ADC"
Description: "An Automated Dispensing Cabinet located in the Cardiology Ward."
* status = #active
* name = "Cardiology Ward ADC Unit A"
* description = "Automated Dispensing Cabinet located in Cardiology North Wing"
* mode = #instance
* form = http://terminology.hl7.org/CodeSystem/location-physical-type#ca "Cabinet"
* partOf = Reference(loc-ward-cardio)