Profile: InventoryItemEAHPInteroperability
Title: "InventoryItem EAHP Interoperability"
Parent: InventoryItem
Description: "Defines the specific logistical unit managed within EAHP interoperability workflows. This resource represents the physical base stock unit as recognized by automated inventory systems. The granularity of this unit is determined by the automation context: it represents a complete commercial pack for whole-pack handling robots, or a single unit dose for unit-dose dispensing robots. Product details (such as name) are derived from the referenced product, while this resource tracks the instance-specific status, location, and expiry"

* name 0..0
  * ^short = "Name is removed to enforce usage of productReference"
  * ^definition = "The name is strictly forbidden to prevent data duplication. The display name must be retrieved from the resolved productReference."
* inventoryStatus MS
* baseUnit MS
* netContent MS
* instance 1..1
* instance.identifier MS
* instance.lotNumber MS
* instance.expiry MS
* instance.location MS
* inventoryStatus MS
* productReference MS