#!/bin/bash
echo "Realizando build de todas imagens para o projeto Fundamentals 2"
version=${version:-1.1}
builder=podman

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

$builder build -t quay.io/gscheffe/dio-frontend:$version frontend/.
$builder build -t quay.io/gscheffe/dio-backend:$version backend/.
$builder build -t quay.io/gscheffe/dio-db:$version db/.
