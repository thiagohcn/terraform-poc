#!/bin/bash
# Deplyoing the infra and the application

#Deploy infra
echo "[INFO] Executing terraform plan"
CD infra
terraform plan -out poc.tfplan

docker tag 13a649dc4bc2 281568417064.dkr.ecr.us-east-1.amazonaws.com/ecr-poc-backend

docker push 281568417064.dkr.ecr.us-east-1.amazonaws.com/ecr-poc-backend

docker tag e39a72a1d82a 281568417064.dkr.ecr.us-east-1.amazonaws.com/ecr-poc-frontend

docker push 281568417064.dkr.ecr.us-east-1.amazonaws.com/ecr-poc-frontend

mv ~/.kube/credentials ~/.kube/config

kubectl apply -f config_map_aws_auth.yaml

kubectl apply -f py-backend/backend.yaml

kubectl apply -f py-backend/backend-service.yaml

kubectl apply -f py-frontend/frontend.yaml