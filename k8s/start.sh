#!/bin/bash
kubectl delete --all deployments
kubectl delete --all services
kubectl delete --all pods

kubectl apply -f todolist-middle-redis.yaml
kubectl apply -f linkus-front-deployment.yaml
kubectl apply -f linkus-back-deployment.yaml

kubectl create -f todolist-middle-redis-lb.yaml
kubectl create -f service-linkus-front-lb.yaml
kubectl create -f service-linkus-back-lb.yaml


kubectl get svc

minikube service list 