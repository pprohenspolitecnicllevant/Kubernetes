#!/bin/bash

# Crear el cluster amb el meu llinatge
kind create cluster --name prohens --config ./cluster.yml

# Cream els dos namespace
kubectl apply -f ./ns.yml

# Deploy del sistema web
kubectl apply -f ./web-deployment.yml