echo "Realizando create/update de todas aplicações no cluster K8s para o projeto Fundamentals 2"

echo "Preparation..."
PREPARATION_FILES=$(ls k8s/01-*.yaml)

for file in $PREPARATION_FILES; do
    kubectl apply -f "$file" --record
    # Verifique se os comandos de implantação foram executados com sucesso
    if [ $? -ne 0 ]; then
        echo "Erro ao executar comandos de implantação."
        exit 1
    fi
done

echo "Deployments"
DEPLOYMENT_FILES=$(ls k8s/02-deployment*|grep -v db)

for file in $DEPLOYMENT_FILES; do
    kubectl apply -f "$file" --record
    # Verifique se os comandos de implantação foram executados com sucesso
    if [ $? -ne 0 ]; then
        echo "Erro ao executar comandos de implantação."
        exit 1
    fi
done

read -p "Persistent DB? (Y/N): " persistent

if [[ $persistent == [yY] || $persistent == [yY][eE][sS] ]]; then
  kubectl apply -f k8s/02-deployment-db-persistent-1.1.yaml --record
else
  kubectl apply -f k8s/02-deployment-db-ephemeral-1.1.yaml --record
fi

# Verifique se os comandos de implantação foram executados com sucesso
if [ $? -ne 0 ]; then
    echo "Erro ao executar comandos de implantação."
    exit 1
fi