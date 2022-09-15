#!/bin/bash

curl -v \
--request POST "https://api.humanitec.io/orgs/$HUMANITEC_ORG/resources/defs/volume/criteria" \
--header "Authorization: Bearer ${HUMANITEC_TOKEN}" \
--header "Content-Type: application/json" \
--data-raw '{ 
  "env_id": "development",
  "app_id": "my-app"
  
}'