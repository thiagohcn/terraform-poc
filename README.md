# Terraform POC (Desafio técnico)

Desenvolvimento do desafio técnico solicitado.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Pré requisitos

Para funcionamento do código utilizado é necessário as seguintes ferramentas intaladas

* [AWS Cli](http://semver.org/)
* [Kubectl](http://semver.org/)
* [Terraform](http://semver.org/)
* [aws authorization](http://semver.org/)
* [Docker](http://semver.org/)
* [Phyton3](http://semver.org/)
* [pip3](http://semver.org/)

Configure as AWS credentials
```
aws configure
```

### infrastructure deploy

Inside infra folder, run the following commands

```
terraform plan -out poc.tfplan
```

```
terraform apply poc.tfplan
```

Move Kube config file 
```
cp kubeconfig_terraform-eks-poc ~/.kube/config
```

Config access 
```
kubectl apply -f config-map-aws-auth_terraform-eks-poc.yaml
```

### Build Docker image

Build backend docker

```
docker build --rm -f "application/py-backend/Dockerfile" -t <ECR URI>/ecr-poc-backend:latest "application/py-frontend"
```

Push the image
```
docker push <ECR URI>/ecr-poc-backend
```

Build frontend docker
```
docker build --rm -f "application/py-frontend/Dockerfile" -t <ECR URI>/ecr-poc-frontend:latest "application/py-frontend"
```

Push the frontend image
```
docker push <ECR URI>/ecr-poc-backend
```

## Kubernetes configuration

Add backend pods

```
kubectl apply -f backend.yaml
```

Add internal loadbalancer
```
kubectl apply -f backend-service.yaml
```

Add frontend pod and external load balancer
```
kubectl apply -f frontend.yaml
```

## Tecnologia utilizada

* AWS (EKS, ECR)
* Terraform
* Docker
* Python

## Fontes de estudo

* [Pluralsight](http://semver.org/)
* [Kubernetes](http://semver.org/)
* [Hashcorp](http://semver.org/)
* [AWS](http://semver.org/)

