#!/bin/bash
echo "Realizando build de todas imagens para o projeto Fundamentals 2"
version=${version:-1.1}
builder=podman
REPO_URL=${REPO_URL:-quay.io/gscheffe}

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
        exit 1
    fi
fi

$builder build -t $REPO_URL/dio-frontend:$version frontend/.
$builder build -t $REPO_URL/dio-backend:$version backend/.
$builder build -t $REPO_URL/dio-db:$version db/.
