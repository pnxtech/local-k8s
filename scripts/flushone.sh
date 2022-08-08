kubectl delete deployment $1-deployment
kubectl delete service $1-cluster-ip-service
kubectl delete configmap $1-config