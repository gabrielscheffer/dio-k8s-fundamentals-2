#!/bin/bash
echo "Realizando push de todas imagens para o projeto Fundamentals 2"
version=${version:-1.1}
builder=podman
REPO_URL=${REPO_URL:-quay.io/gscheffe}
DOCKER_REGISTRY_USER=${DOCKER_REGISTRY_USER:-gscheffe}
DOCKER_REGISTRY_PASSWORD=${DOCKER_REGISTRY_PASSWORD:-mypassword}


# Verifica se o comando podman está disponível
if command -v podman &> /dev/null; then
    echo "Comando podman está disponível."
else
    # Verifica se o comando docker está disponível
    if command -v docker &> /dev/null; then
        echo "Comando docker está disponível."
        builder=docker
    else
        echo "Nenhum comando de contêiner (podman ou docker) encontrado."
        return -1
    fi
fi

$builder login -u $DOCKER_REGISTRY_USER -p $DOCKER_REGISTRY_PASSWORD $REPO_URL
$builder push quay.io/gscheffe/dio-frontend:$version
$builder push quay.io/gscheffe/dio-backend:$version
$builder push quay.io/gscheffe/dio-db:$version
