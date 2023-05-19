#!/bin/bash
echo "Extrai url local do minikube"
echo "Backend:"
minikube service backend --url
echo "Frontend:"
minikube service frontend --url