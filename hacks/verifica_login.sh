#!/bin/bash

# Verifica o contexto atualmente configurado no kubectl
CURRENT_CONTEXT=$(kubectl config current-context)

# Verifica se o contexto é válido ou está vazio
if [ -n "$CURRENT_CONTEXT" ]; then
    echo "Você está logado no kubectl. Contexto atual: $CURRENT_CONTEXT"
else
    echo "Você não está logado no kubectl."
fi
