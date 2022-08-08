# load core services
kubectl apply -f configs/redis.yaml  
kubectl apply -f configs/mongodb.yaml  

# load application services
kubectl apply -f configs/hydra-router.yaml
kubectl apply -f configs/hydra-synchron-svcs.yaml

echo "Cluster started"
echo "In this terminal window type: kubectl port-forward --address localhost service/hydra-router-cluster-ip-service 5353:5353"
echo "In another terminal window type: ngrok.exe http --subdomain=cjus 5353"
