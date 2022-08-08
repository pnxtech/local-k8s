openssl genrsa -out auth-v1-svcs-private-cert.pem 1024
openssl rsa -in auth-v1-svcs-private-cert.pem -pubout > auth-v1-svcs-public-cert.pub
chmod 600 auth-v1-svcs*
sudo mv auth-v1-svcs* secrets

kubectl delete secret auth-jwt-public-cert --ignore-not-found
kubectl create secret generic auth-jwt-public-cert --from-file=secrets/auth-v1-svcs-public-cert.pub
kubectl delete secret auth-jwt-private-cert --ignore-not-found
kubectl create secret generic auth-jwt-private-cert --from-file=secrets/auth-v1-svcs-private-cert.pem
