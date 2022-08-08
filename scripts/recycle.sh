DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
kubectl delete deployment $1-deployment
kubectl delete service $1-cluster-ip-service
kubectl delete configmap $1-config
source ${DIR}/tminus.sh "Starting services in T-" 3
kubectl apply -f configs/$1.yaml
kubectl get pods | grep $1

