export CLUSTER_HOST=""
export DOCKER_USERNAME=""
export DOCKER_PASSWORD=""
export DOCKER_EMAIL=""
export GITHUB_TOKEN=""

while : ; do
  case "$1" in 
    --local_cluster_host)
       export CLUSTER_HOST="$2"
       shift 2 ;;
    --docker_username)
       export DOCKER_USERNAME="$2"
       shift 2 ;;
    --docker_password)
       export DOCKER_PASSWORD="$2"
       shift 2 ;;
    --docker_email)
       export DOCKER_EMAIL="$2"
       shift 2 ;;
    --github_token)
       export GITHUB_TOKEN="$2"
       shift 2 ;;
    *)
       break ;;
  esac
done

sudo mkdir -p /Volumes/hydra-logging
sudo chown ${USER}:staff /Volumes/hydra-logging
mkdir secrets

#kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.41.2//deploy/static/provider/cloud/deploy.yaml
#kubectl wait --namespace ingress-nginx \
# --for=condition=ready pod \
# --selector=app.kubernetes.io/component=controller \
# --timeout=120s

kubectl delete secret docker-registry regsecret --ignore-not-found
kubectl create secret docker-registry regsecret --docker-username=$DOCKER_USERNAME --docker-password=$DOCKER_PASSWORD --docker-email=$DOCKER_EMAIL

source scripts/github-setup.sh $GITHUB_TOKEN
source scripts/auth-certs-setup.sh
