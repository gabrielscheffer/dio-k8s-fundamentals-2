#!/bin/bash

# Defina o caminho para o arquivo de configuração do Kubernetes recebido como variável de ambiente
KUBECONFIG_PATH="/tmp/kubeconfig.yaml"

# Salve o conteúdo da variável de ambiente KUBECONFIG em um arquivo
echo "$KUBECONFIG" > "$KUBECONFIG_PATH"

# Verifique se o arquivo de configuração foi salvo corretamente
if [ $? -ne 0 ]; then
    echo "Erro ao salvar o arquivo de configuração do Kubernetes."
    exit 1
fi

# Faça login no cluster Kubernetes usando o arquivo de configuração
echo "Fazendo login no cluster Kubernetes..."
kubectl --kubeconfig="$KUBECONFIG_PATH" config use-context my-cluster

# Verifique se o login foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao fazer login no cluster Kubernetes."
    exit 1
fi

# Execute comandos de implantação usando o kubectl
echo "Executando comandos de implantação..."
PREPARATION_FILES=$(ls k8s/01-*.yaml)

for file in $PREPARATION_FILES; do
    kubectl --kubeconfig="$KUBECONFIG_PATH" apply -f "$file" --record
    # Verifique se os comandos de implantação foram executados com sucesso
    if [ $? -ne 0 ]; then
        echo "Erro ao executar comandos de implantação."
        exit 1
    fi
done

echo "Deployments..."
DEPLOYMENT_FILES=$(ls k8s/02-deployment*|grep -v db)

for file in $DEPLOYMENT_FILES; do
    kubectl --kubeconfig="$KUBECONFIG_PATH" apply -f "$file" --record
    # Verifique se os comandos de implantação foram executados com sucesso
    if [ $? -ne 0 ]; then
        echo "Erro ao executar comandos de implantação."
        exit 1
    fi
done

kubectl --kubeconfig="$KUBECONFIG_PATH" apply -f  k8s/02-deployment-db-persistent-1.1.yaml --record

# Verifique se os comandos de implantação foram executados com sucesso
if [ $? -ne 0 ]; then
    echo "Erro ao executar comandos de implantação."
    exit 1
fi

echo "Implantação concluída com sucesso!"