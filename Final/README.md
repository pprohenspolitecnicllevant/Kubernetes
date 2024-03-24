Exercici1
kind create cluster --name prohens --config .\cluster.yml
kubectl apply -f .\ns.yml
kubectl apply -f .\web-deployment.yml

falta liveness readness i envs per connectar base de dades.

Exercici2