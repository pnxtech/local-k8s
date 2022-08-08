GITHUB_TOKEN="$1"
rm secrets/.github 2> /dev/null
echo "GITHUB_TOKEN=$GITHUB_TOKEN" >> secrets/.github

kubectl delete secret github-credentials --ignore-not-found
kubectl create secret generic github-credentials --from-file=secrets/.github

