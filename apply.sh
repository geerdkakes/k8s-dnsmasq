#!/usr/bin/env bash
#
# Script redeploy resources after changing configuration
#


# delete configmap and deployment. Deployment uses the configmap to create new
# configuration files upon startup.
#
# change the namespace (now rtk)
#

kubectl delete configmap -n rtk dnsmasq-config

# deploy configmap and deployment
kubectl create configmap dnsmasq-config -n rtk --from-file=./etc/
kubectl apply -f dnsmasq.yaml -n rtk