Instance: dev-robot-wholepack-01
InstanceOf: DeviceEAHPInteroperability
Usage: #example
Title: "Device - Central Pharmacy Robot Actor"
Description: "The automation actor corresponding to the main robot storage location."

* identifier
  * system = "http://hospital.org/assets/device"
  * value = "ROBOT-CORE-01"
* name
  * value = "Central Pharmacy Storage Unit Alpha"
  * type = #user-friendly-name
* type = EAHPMedicineHandlingAutomationTypes#WholePackRobot
* location = Reference(loc-robot-main)

Instance: dev-adc-cardio-01
InstanceOf: DeviceEAHPInteroperability
Usage: #example
Title: "Device - Cardiology ADC Actor"
Description: "The automation actor corresponding to the ADC in the cardiology ward."

* identifier
  * system = "http://hospital.org/assets/device"
  * value = "ADC-CARDIO-N"
* name
  * value = "Cardiology North Dispenser"
  * type = #user-friendly-name
* type = EAHPMedicineHandlingAutomationTypes#AutomatedDispensingCabinet

* location = Reference(loc-adc-cardio-01)

Instance: dev-unidose-robot-01
InstanceOf: DeviceEAHPInteroperability
Usage: #example
Title: "Device - UniDose Production Robot"
Description: "Robot for de-blistering and packaging, located in the central pharmacy room."

* identifier
  * system = "http://hospital.org/assets/device"
  * value = "UD-PACK-05"
* name
  * value = "Unit Dose Line 1"
  * type = #user-friendly-name
* type = EAHPMedicineHandlingAutomationTypes#UniDoseRobot

* location = Reference(loc-pharmacy-central-room)

Instance: dev-compounding-robot-01
InstanceOf: DeviceEAHPInteroperability
Usage: #example
Title: "Device - Compounding Robot"
Description: "Robotic arm system for preparing infusions."

* identifier
  * system = "http://hospital.org/assets/device"
  * value = "IV-ROBOT-01"
* name
  * value = "Cytotoxic Prep Unit"
  * type = #user-friendly-name
* type = EAHPMedicineHandlingAutomationTypes#CompoundingRobot
* location = Reference(loc-pharmacy-central-room)

Instance: dev-smartcart-cardio-01
InstanceOf: DeviceEAHPInteroperability
Usage: #example
Title: "Device - Cardiology Smart Cart"
Description: "Mobile administration cart used in the cardiology ward."

* identifier
  * system = "http://hospital.org/assets/device"
  * value = "CART-CARDIO-01"
* name
  * value = "Cardiology Mobile Cart Blue"
  * type = #user-friendly-name
* type = EAHPMedicineHandlingAutomationTypes#SmartCart
* location = Reference(loc-ward-cardio)