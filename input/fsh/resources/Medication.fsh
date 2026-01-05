Profile: MedicationEAHP
Title: "Medication EAHP Interoperability"
Parent: Medication
Description: "A wrapper profile treating Medication as a logistical SKU. Used for automations (leaves) where the HIS Code is the Resource ID. This resource can represent a physical item (Brand) or a virtual concept (Generic Formulation)."

* id 1..1
  * ^short = "The HIS Item Code (e.g. M00345)"
  * ^definition = "The id of the resource MUST be the HIS Item Code. This allows direct addressing (e.g., /Medication/M00345). MUST match regex [A-Za-z0-9\\-\\.]{1,64}"

* code 1..1 MS
  * text 1..1 MS
    * ^short = "Description of the item"

* status MS