#!/bin/bash

PROJECT_ID="seclab-team-xxx"
ACCOUNT_NAME="your_service_account_name"
EMAIL="your_gmail_account_name@gmail.com"

ACCOUNT="${ACCOUNT_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"
ROLES=(
  'roles/compute.admin'
  'roles/iam.serviceAccountActor'
)

gcloud iam service-accounts create ${ACCOUNT_NAME} --display-name "${ACCOUNT_NAME}"
gcloud iam service-accounts keys create "${ACCOUNT_NAME}.key.json" --iam-account $ACCOUNT
# gcloud iam roles
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member "serviceAccount:${ACCOUNT}" \
  --role "${ROLES}"