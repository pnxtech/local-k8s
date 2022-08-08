# local-k8s
Local Kubernetes Cluster

This repo is design to enable a Kubernetes cluster environment for use in development. 

The cluster hosts services such as a single instance of Redis and MongoDB.  

## Machine setup

### Docker Desktop
This Kubernetes setup relies on an installation of [Docker Desktop]() . Once installed make sure to enable Kubernetes on the Docker Desktop dashboard.

## Cluster Setup
Execute the one time init script. Optionally, include the `local_cluster_host` argument pointed at your ngrok origin, ie: https://some-unique-subdomain.ngrok.io. But all other arguments are required to run the init script.

Usage:
```shell
$ ./one-time-init.sh \
  --local_cluster_host localk8s.ngrok.io \
  --docker_username <docker-username> \
  --docker_password "<docker-password>" \
  --docker_email <docker-email> \
  --github_token <github-readonly-token>
```

For ease, copy the command above into init.sh and execute it.  The `init.sh` is automatically excluded from github and may be deleted after use.

## Starting and stopping the Local K8s cluster

### On MacOS

Starting: 

```sh
./startup.sh
```

Stopping:

```sh
./shutdown.sh
```

### On Windows

Starting: 

```sh
.\startup.ps1
```

Stopping:

```sh
.\shutdown.ps1
```

## Access local gateway rouer
```
{sudo} kubectl port-forward --address 0.0.0.0 service/hydra-router-cluster-ip-service 80:5353
kubectl port-forward --address 0.0.0.0 service/redis-cluster-ip-service 6379:6379
```

## Optional: using ngrok

```
 ./ngrok.exe http --subdomain=cjus 80
```

## Use of Redis
This repo uses RedisStack to enable a local Redis server. It's highly recommended that you consider using RedisInsight to access the Redis Service.

Download a version for your OS: https://redis.io/docs/stack/insight/#download-the-latest-redisinsight
