kubectl delete deployment hydra-router-deployment
kubectl delete service hydra-router-cluster-ip-service
kubectl delete configmap hydra-router-config

kubectl delete deployment hydra-synchron-svcs-deployment
kubectl delete service hydra-synchron-svcs-cluster-ip-service
kubectl delete configmap hydra-synchron-svcs-config

kubectl delete deployment mongo-deployment
kubectl delete service mongo-cluster-ip-service

kubectl delete deployment redis-deployment
kubectl delete service redis-cluster-ip-service

echo "Services shutdown complete"