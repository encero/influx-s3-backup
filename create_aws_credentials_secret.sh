#!/usr/bin/env bash
set -euo pipefail


: ${AWS_SECRET_ACCESS_KEY:?"AWS_SECRET_ACCESS_KEY env variable is required"}
: ${AWS_ACCESS_KEY_ID:?"AWS_ACCESS_KEY_ID env variable is required"}
: ${NAMESPACE:?"NAMESPACE env variable is required"}
: ${SECRET_NAME:?"SECRET_NAME env variable is required"}

kubectl --namespace "${NAMESPACE}" create secret generic "${SECRET_NAME}" \
    --from-literal=access-key="${AWS_ACCESS_KEY_ID}" \
    --from-literal=access-secret-key="${AWS_SECRET_ACCESS_KEY}"
