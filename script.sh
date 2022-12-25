#!/bin/bash
echo "Criando imagens ..."

docker build -t clemmente/projeto-dio-backend:1.0 backend/.
docker build -t clemmente/projeto-dio-database:1.0 database/.

echo "Realizando push das imagens ..."

docker push clemmente/projeto-dio-backend:1.0
docker push clemmente/projeto-dio-database:1.0

echo "Criando serviços no cluster kubernetes ..."

kubectl apply -f ./services.yml

echo "Criando os deployments"

kubectl apply -f ./deployment.yml