#!/bin/bash

curl -v \
--request POST "https://api.humanitec.io/orgs/${HUMANITEC_ORG}/definitions" \
--header "Authorization: Bearer ${HUMANITEC_TOKEN}" \
--header "Content-Type: application/json" \
--data-raw '{
    "id": "volume",
    "type": "volume-pvc",
    "driver_type": "humanitec/volume-pvc",
    "driver_inputs": {
      "values": {
        "access_mode": "ReadWriteMany",
        "storage_capacity": "10Gi",
        "storage_class_name": "default"
      },
    }
}'