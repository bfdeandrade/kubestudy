#/bin/bash


#Iniciando minikube com docker 
minikube start --force --driver=docker --host-only-cidr 192.168.15.0/24


#Criando pod com nginx image

minikube start --force --driver=docker

#Verificando os pods em execução

kubectl get pods

#Detalha o status do pod

kubectl describe pod <podname>

#Show detailed information using get pods command

kubectl get pods -o wide

#Create pod using using yaml file. ONLY WORKS WITHOUT FIRST TIME OF EXECUTION ERROR IF RESOURCE ALREADY EXISTS

kubectl create -f <arquivo>

#Apply updates to an already created container

kubectl apply -f <arquivo>

#Dry run para gerar um arquivo para deploy

kubectl run <pod_name> --image=<nome_daimage> --dry-run=client -o yaml > nome_arquivo.yaml

#Allow editing pod config files for a running pod

kubectl edit pods <pod_name> 

#Replace number of replicas

kubectl replace <replica-set-file>

kubectl scale --replicas=6 <kind config = replicaset> <name field in the metadata field> 

#Delete componentes

kubectl delete <pods, replicaset, deployment> <name of component or all>

#Verify rollout of a deployment

kubectl rollout status deployment.apps/<name of the deployment>

#Check history of rollout of a deployment

kubectl rollout history deployment.apps/<name of the deployment>

# Create a new deployment and specify a cause

kubectl create -f deployment.yaml --record 

#Set image value 

kubectl set image deployment <nome do deployment> <image>=<version>

#Create a service yaml file

kubectl expose deployment <deployment app name> --name=webapp-service --target-port=8080 --type=NodePort --port=8080 --dry-run=client -o yaml > svc.yaml