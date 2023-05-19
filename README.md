# Kubernetes Training DIO Project 2
Repo used for training purposes

### Execução Local
Certifique que você está logado no cluster k8s, usando `kubectl config current-context` ou use o script verifica_login.sh na pasta hacks.

Exporte as variáveis de ambiente conforme abaixo:
 - **REPO_URL** o registry remoto que será usado para fazer push das imagens de container aqui construídas.
 - **DOCKER_REGISTRY_USER** seu usuário do registry remoto
 - **DOCKER_REGISTRY_PASSWORD** sua senha do registry remoto

E então execute o *makeAll.sh*
Com o build executado com sucesso rode o hack/getUrl.sh para pegar as url de acesso do minikube.
Em tempo de execução altere a variável de ambiente API_URL do frontend para apontar para a url pública acima.
Dica: Use kubectl edit deploy frontend

### Execução Gitlab
Utilize o *gitlab-ci.yaml*
Passando por variável de ambiente:
 - **$KUBECONFIG** o arquivo kubeconfig.yaml contendo o login para o cluster em cloud.
 - **$CI_REGISTRY_USER** usuário de login para o registry quay.io
 - **$CI_REGISTRY_PASSWORD** senha de login para o registry quay.io

Em tempo de execução altere a variável de ambiente API_URL do frontend para apontar para a url pública acima.