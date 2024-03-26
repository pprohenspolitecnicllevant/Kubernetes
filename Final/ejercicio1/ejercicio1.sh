#!/bin/bash

# Crear el cluster amb el meu llinatge
kind create cluster --name prohens --config ./cluster.yml

# Cream els dos namespace
kubectl apply -f ./ns.yml

# Cream ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s

# Creem el configmap
kubectl apply -f ./configmap.yml

# Creem el persistentVolume i el persistentVolumeClaim
kubectl apply -f ./pv.yml
kubectl apply -f ./pvc.yml

# Deploy del 3 serveis
kubectl apply -f ./db-deployment.yml
kubectl apply -f ./web-deployment.yml
kubectl apply -f ./content-deployment.yml

# Services
kubectl apply -f ./service-db.yml
kubectl apply -f ./service-web.yml
kubectl apply -f ./service-content.yml

# Ingress
kubectl apply -f ./ingress.yml
