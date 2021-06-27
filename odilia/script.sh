#!/bin/bash
# install MetalLB
kubectl get configmap kube-proxy -n kube-system -o yaml | sed -e "s/strictARP: false/strictARP: true/" | kubectl apply -f - -n kube-system
kubectl apply -f metallb_namespace.yml
kubectl apply -f metallb.yml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl create -f metallb_configmap.yml 
sleep 120
