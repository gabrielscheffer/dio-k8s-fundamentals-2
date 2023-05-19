#!/bin/bash
echo "Fazendo select no banco"
DBPOD=$(kubectl get pods -o name|grep dio-db) 
kubectl exec --stdin --tty $DBPOD -- /usr/bin/mysql -u root --password=qwerty.1234 --execute='select * from mensagens;' desafio2
