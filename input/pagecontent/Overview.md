# Integration Scenario: Item Replenishment closed loop.

Version: 0.1
## Context: EAHP Interoperability - Automated Stock Replenishment

This document details the standard API interactions between a Requester Automation and Supplier Automation to automate stock replenishment.
This scenario specifically illustrates a "Split Line" order where the requester needs the same medication (Ibuprofen 600mg) in two different forms/quantities within a single transaction:
- Line 1: Ibuprofen 600mg (1 Whole Pack)
- Line 2: Ibuprofen 600mg (30 Unit Doses)

The workflow ensures a closed-loop supply chain where stock is verified before ordering, and specific serial numbers are tracked upon delivery for Falsified Medicines Directive (FMD) compliance.

## The Actors

In this FHIR workflow, we distinguish between the places where items are stored and the agents (automations) that act upon them.
### Requester (Consumer): Device/requester-automation-01

Role: The system detecting low stock, initiating the request and receiving the delivery. Supported Automation Types:

- Automated Dispensing Cabinet (ADC): A ward-based cabinet requesting replenishment for depleted medicines. Can contain both whole or partial packs or unidoses.
- Unit Dose Robot (UDR): A central robot requesting full packs from storage to de-blister/singularize into unit doses.
- Compounding Robot (CR): A robot requesting raw materials (vials, diluents) to prepare IV bags or chemotherapy.
- Smart Cart: A mobile inventory unit aiding administration at the bedside.

### Supplier (Source): Device/supplier-automation-01

Role: The system responsible for picking items. It acts as the "Reporter" in inventory checks and the "Supplier" in delivery notes. Supported Automation Types:

- Whole Pack Robot: A storage robot managing complete boxes (e.g., standard pharmacy storage).
- Unit Dose Robot (UDR): A robot capable of dispensing individual pills or blisters for specific patient orders.
- Automated Dispensing Cabinet (ADC): In decentralized models, a main cabinet might supply smart carts.

## Step 1: Check Stock Availability (optional)

Goal: The Requester Automation checks if the Supplier Automation has enough stock of Ibuprofen (both packs and loose units) before placing an order.

Rationale: To prevent partial fulfillment or back-orders, the Requester queries the current status of the Supplier. This step avoids the scenario where a robot accepts an order it cannot physically fulfill and only upon delivery the requester discovers that it can not be replanished. 
With this call, the stock of the supplier automation for certain medicine is obtained. The automation is identified through the `location` filter.

```
Method: GET Path: /InventoryReport?status=active&item=Medication/M00345&location=Location/loc-robot-main
```
The robot replies with an InventoryReport resource. Crucially, this report uses countType: snapshot, which creates a "frozen" point-in-time view of the inventory. 
It uses Contained Resources to provide details on the specific lots available without requiring extra API calls.
```

{
  "resourceType" : "InventoryReport",
  "id" : "InventoryReport-GlobalPharmaIbuprofen-Example",
  "contained" : [
    {
      "resourceType" : "InventoryItem",
      "id" : "8d043738-bf48-4a2b-aba5-a4a9e8744f63",
      "meta" : {
        "profile" : [
          🔗 "https://afriscic.github.io/EAHP_Interoperabillty//StructureDefinition/InventoryItemEAHPInteroperability"
        ]
      },
      "status" : "active",
      "baseUnit" : {
        "coding" : [
          {
            "system" : "https://afriscic.github.io/EAHP_Interoperabillty//CodeSystem/eahp-logistics-unit-cs",
            "code" : "indivisible-logistical-unit"
          }
        ]
      },
      "netContent" : {
        "value" : 1,
        "unit" : "Indivisible Logistical Unit",
        "system" : "http://example.org/CodeSystem/eahp-logistics-unit-cs",
        "code" : "indivisible-logistical-unit"
      },
      "instance" : {
        "identifier" : [
          {
            "type" : {
              "coding" : [
                {
                  "system" : "https://afriscic.github.io/EAHP_Interoperabillty//CodeSystem/eahp-identifier-type-cs",
                  "code" : "FMD_BARCODE"
                }
              ]
            },
            "value" : "01050991510150511078241PC\u001d17260530211HXNA4G4VM"
          }
        ],
        "lotNumber" : "78241PC",
        "expiry" : "2026-05-30"
      },
      "productReference" : {
        🔗 "reference" : "Medication/M00345"
      }
    },
    {
      "resourceType" : "InventoryItem",
      "id" : "e2d2688f-2854-48ac-a87a-cb6f4105b36c",
      "meta" : {
        "profile" : [
          🔗 "https://afriscic.github.io/EAHP_Interoperabillty//StructureDefinition/InventoryItemEAHPInteroperability"
        ]
      },
      "status" : "active",
      "baseUnit" : {
        "coding" : [
          {
            "system" : "https://afriscic.github.io/EAHP_Interoperabillty//CodeSystem/eahp-logistics-unit-cs",
            "code" : "indivisible-logistical-unit"
          }
        ]
      },
      "netContent" : {
        "value" : 30,
        "unit" : "Indivisible Logistical Unit",
        "system" : "http://example.org/CodeSystem/eahp-logistics-unit-cs",
        "code" : "indivisible-logistical-unit"
      },
      "instance" : {
        "identifier" : [
          {
            "type" : {
              "coding" : [
                {
                  "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code" : "SNO"
                }
              ]
            },
            "system" : "https://www.gs1.org/gtin/05099151015051",
            "value" : "1HXRG3R6T3"
          }
        ],
        "lotNumber" : "78241PC",
        "expiry" : "2026-05-30"
      },
      "productReference" : {
        🔗 "reference" : "Medication/M00345"
      }
    },
    {
      "resourceType" : "InventoryItem",
      "id" : "9042a2ba-724c-47e4-b64c-6054da9dd4fa",
      "meta" : {
        "profile" : [
          🔗 "https://afriscic.github.io/EAHP_Interoperabillty//StructureDefinition/InventoryItemEAHPInteroperability"
        ]
      },
      "status" : "active",
      "baseUnit" : {
        "coding" : [
          {
            "system" : "https://afriscic.github.io/EAHP_Interoperabillty//CodeSystem/eahp-logistics-unit-cs",
            "code" : "indivisible-logistical-unit"
          }
        ]
      },
      "netContent" : {
        "value" : 1,
        "unit" : "Indivisible Logistical Unit",
        "system" : "http://example.org/CodeSystem/eahp-logistics-unit-cs",
        "code" : "indivisible-logistical-unit"
      },
      "instance" : {
        "identifier" : [
          {
            "type" : {
              "coding" : [
                {
                  "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code" : "RI"
                }
              ]
            },
            "system" : "http://myhospital.org/unidoserobot-1/pick-ids",
            "value" : "0123456789"
          }
        ],
        "lotNumber" : "78241PC",
        "expiry" : "2026-05-30"
      },
      "productReference" : {
        🔗 "reference" : "Medication/M00345"
      }
    }
  ],
  "status" : "active",
  "countType" : "snapshot",
  "reportedDateTime" : "2024-12-01T10:30:00Z",
  "reporter" : {
    "reference" : "Practitioner/example-pharmacist",
    "display" : "Hospital Pharmacist"
  },
  "reportingPeriod" : {
    "start" : "2024-12-01T00:00:00Z",
    "end" : "2024-12-01T23:59:59Z"
  },
  "inventoryListing" : [
    {
      "location" : {
        "reference" : "Location/example-pharmacy",
        "display" : "Hospital Pharmacy"
      },
      "countingDateTime" : "2024-12-01T10:00:00Z",
      "item" : [
        {
          "quantity" : {
            "value" : 1,
            "system" : "http://hl7.org/fhir/medicinal-product-package-type",
            "code" : "100000143555"
          },
          "item" : {
            "reference" : {
              "reference" : "#8d043738-bf48-4a2b-aba5-a4a9e8744f63",
              "display" : "Brufen 30x600mg Pack - Lot 78241PC"
            }
          }
        },
        {
          "quantity" : {
            "value" : 1,
            "system" : "http://hl7.org/fhir/medicinal-product-package-type",
            "code" : "100000143555"
          },
          "item" : {
            "reference" : {
              "reference" : "#e2d2688f-2854-48ac-a87a-cb6f4105b36c",
              "display" : "Brufen 30x600mg Pack - Lot 78241PC"
            }
          }
        },
        {
          "quantity" : {
            "value" : 30,
            "system" : "http://snomed.info/sct",
            "code" : "421026006"
          },
          "item" : {
            "reference" : {
              "reference" : "#9042a2ba-724c-47e4-b64c-6054da9dd4fa",
              "display" : "Brufen 30x600mg Unit dose - Lot 78241PC"
            }
          }
        }
      ]
    }
  ]
}
```
## Step 2: Place Order (SupplyRequest)

Goal: The Ward Cabinet formally requests 1 Unit Dose of Ibuprofen and 30 Unit Doses of Ibuprofen.

Mechanism:
- Transaction Bundle: All the lines belonging to the same logical order are together.
- Requisition ID: Both requests (REQ-12345) share the same requisition, grouping them into one logistical order.
- Mandatory Fields: Includes deliverFrom to specify the source automation.
```
Method: POST Path: / (Root endpoint)
```
Request Body (Transaction Bundle):

```
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "resourceType" : "SupplyRequest",
      "id" : "SupplyRequest-IbuprofenTablet-1Unidose",
      "meta" : {
        "profile" : [
          🔗 "https://afriscic.github.io/EAHP_Interoperabillty//StructureDefinition/SupplyRequestEAHPInteroperability"
        ]
      },
      "identifier" : [
        {
          "type" : {
            "coding" : [
              {
                "system" : "https://afriscic.github.io/EAHP_Interoperabillty//CodeSystem/eahp-supply-request-identifier-type-cs",
                "code" : "RequestId"
              }
            ]
          },
          "system" : "http://hospital-system.org/requests",
          "value" : "REQ-12345"
        }
      ],
      "item" : {
        "reference" : {
          🔗 "reference" : "Medication/M00345"
        }
      },
      "quantity" : {
        "value" : 1,
        "unit" : "Indivisible Logistical Unit",
        "system" : "http://example.org/CodeSystem/eahp-logistics-unit-cs",
        "code" : "indivisible-logistical-unit"
      },
      "authoredOn" : "2025-11-30T10:30:00Z",
      "requester" : {
        🔗 "reference" : "Device/dev-adc-cardio-01",
        "display" : "Cardiology Ward ADC"
      },
      "deliverFrom" : {
        🔗 "reference" : "Location/loc-robot-main",
        "display" : "Hospital Pharmacy"
      },
      "deliverTo" : {
        🔗 "reference" : "Location/loc-adc-cardio-01",
        "display" : "Cardiology Ward ADC"
      }
    },
    {
      "resourceType" : "SupplyRequest",
      "id" : "SupplyRequest-IbuprofenTablet-1Pack",
      "meta" : {
        "profile" : [
          🔗 "https://afriscic.github.io/EAHP_Interoperabillty//StructureDefinition/SupplyRequestEAHPInteroperability"
        ]
      },
      "identifier" : [
        {
          "type" : {
            "coding" : [
              {
                "system" : "https://afriscic.github.io/EAHP_Interoperabillty//CodeSystem/eahp-supply-request-identifier-type-cs",
                "code" : "RequestId"
              }
            ]
          },
          "system" : "http://hospital-system.org/requests",
          "value" : "REQ-12345"
        }
      ],
      "item" : {
        "reference" : {
          🔗 "reference" : "Medication/M00345"
        }
      },
      "quantity" : {
        "value" : 30,
        "unit" : "Indivisible Logistical Unit",
        "system" : "http://example.org/CodeSystem/eahp-logistics-unit-cs",
        "code" : "indivisible-logistical-unit"
      },
      "authoredOn" : "2025-11-30T10:30:00Z",
      "requester" : {
        🔗 "reference" : "Device/dev-adc-cardio-01",
        "display" : "Cardiology Ward ADC"
      },
      "deliverFrom" : {
        🔗 "reference" : "Location/loc-robot-main",
        "display" : "Hospital Pharmacy"
      },
      "deliverTo" : {
        🔗 "reference" : "Location/loc-adc-cardio-01",
        "display" : "Cardiology Ward ADC"
      }
    }
  ]
}
```
## Step 3: Fulfill and Deliver (SupplyDelivery)

Goal: The Robot confirms delivery of both the Unit Doses and the Whole Pack.


Operational Detail: 
- Contained Items: The specific items (with Serials/Lots) are embedded in the contained array to avoid roundtrips.
- Supplier Extension: The supplier field uses the SupplierDevice extension to reference the robot, as Device is not a standard target for this field.
```
Method: POST Path: /SupplyDelivery
```

Request Body (Sent by Supplier):
```

{
  "resourceType" : "SupplyDelivery",
  "id" : "SupplyDelivery-IbuprofenTabletPack-Example",
  "meta" : {
    "profile" : [
      🔗 "https://afriscic.github.io/EAHP_Interoperabillty//StructureDefinition/SupplyDeliveryEAHPInteroperability"
    ]
  },
  "contained" : [
    {
      "resourceType" : "InventoryItem",
      "id" : "9042a2ba-724c-47e4-b64c-6054da9dd4fa",
      "meta" : {
        "profile" : [
          🔗 "https://afriscic.github.io/EAHP_Interoperabillty//StructureDefinition/InventoryItemEAHPInteroperability"
        ]
      },
      "status" : "active",
      "baseUnit" : {
        "coding" : [
          {
            "system" : "https://afriscic.github.io/EAHP_Interoperabillty//CodeSystem/eahp-logistics-unit-cs",
            "code" : "indivisible-logistical-unit"
          }
        ]
      },
      "netContent" : {
        "value" : 1,
        "unit" : "Indivisible Logistical Unit",
        "system" : "http://example.org/CodeSystem/eahp-logistics-unit-cs",
        "code" : "indivisible-logistical-unit"
      },
      "instance" : {
        "identifier" : [
          {
            "type" : {
              "coding" : [
                {
                  "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code" : "RI"
                }
              ]
            },
            "system" : "http://myhospital.org/unidoserobot-1/pick-ids",
            "value" : "0123456789"
          }
        ],
        "lotNumber" : "78241PC",
        "expiry" : "2026-05-30"
      },
      "productReference" : {
        🔗 "reference" : "Medication/M00345"
      }
    },
    {
      "resourceType" : "InventoryItem",
      "id" : "e2d2688f-2854-48ac-a87a-cb6f4105b36c",
      "meta" : {
        "profile" : [
          🔗 "https://afriscic.github.io/EAHP_Interoperabillty//StructureDefinition/InventoryItemEAHPInteroperability"
        ]
      },
      "status" : "active",
      "baseUnit" : {
        "coding" : [
          {
            "system" : "https://afriscic.github.io/EAHP_Interoperabillty//CodeSystem/eahp-logistics-unit-cs",
            "code" : "indivisible-logistical-unit"
          }
        ]
      },
      "netContent" : {
        "value" : 30,
        "unit" : "Indivisible Logistical Unit",
        "system" : "http://example.org/CodeSystem/eahp-logistics-unit-cs",
        "code" : "indivisible-logistical-unit"
      },
      "instance" : {
        "identifier" : [
          {
            "type" : {
              "coding" : [
                {
                  "system" : "https://afriscic.github.io/EAHP_Interoperabillty//CodeSystem/eahp-identifier-type-cs",
                  "code" : "FMD_BARCODE"
                }
              ]
            },
            "value" : "01050991510150511078241PC\u001d17260530211HXRG3R6T3"
          },
          {
            "type" : {
              "coding" : [
                {
                  "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code" : "SNO"
                }
              ]
            },
            "value" : "1HXRG3R6T3"
          },
          {
            "type" : {
              "coding" : [
                {
                  "system" : "https://afriscic.github.io/EAHP_Interoperabillty//CodeSystem/eahp-identifier-type-cs",
                  "code" : "PRODUCT_BARCODE"
                }
              ]
            },
            "value" : "05099151015051"
          }
        ],
        "lotNumber" : "78241PC",
        "expiry" : "2026-05-30"
      },
      "productReference" : {
        🔗 "reference" : "Medication/M00345"
      }
    }
  ],
  "basedOn": [
    { "reference": "SupplyRequest/SupplyRequest-IbuprofenTablet-1Unidose"},
    { "reference": "SupplyRequest/SupplyRequest-IbuprofenTablet-1Pack"}
  ],
  "status" : "completed",
  "suppliedItem" : [
    {
      "quantity": { 
        "value": 1, 
        "unit": "Indivisible Logistical Unit", 
        "system" : "http://example.org/CodeSystem/eahp-logistics-unit-cs",
        "code" : "indivisible-logistical-unit"
      },
      "itemReference" : {
        "reference" : "#9042a2ba-724c-47e4-b64c-6054da9dd4fa"
      }
    },
    {
      "quantity": {
        "value": 30, 
        "unit": "Indivisible Logistical Unit", 
        "system" : "http://example.org/CodeSystem/eahp-logistics-unit-cs",
        "code" : "indivisible-logistical-unit"
      },
      "itemReference" : {
        "reference" : "#e2d2688f-2854-48ac-a87a-cb6f4105b36c"
      }
    }
  ],
  "supplier" : {
    "extension" : [
      {
        "url" : "https://afriscic.github.io/EAHP_Interoperabillty//StructureDefinition/supplier-device",
        "valueReference" : {
          🔗 "reference" : "Device/dev-robot-wholepack-01"
        }
      }
    ],
    "display" : "Central Pharmacy Robot"
  },
  "destination" : {
    🔗 "reference" : "Location/loc-adc-cardio-01",
    "display" : "Cardiology Automated Dispensing Cabiner"
  }
}
```