#! /usr/bin/env bash

clear
#
echo
echo "Load Tiller and Initialize helm"
echo
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm init
echo
echo "Load Service Catalog Repos and then load Service Catlog into the cluster"
echo
helm repo add svc-cat https://svc-catalog-charts.storage.googleapis.com
kubectl create clusterrolebinding tiller-cluster-admin \
  --clusterrole=cluster-admin  \
  --serviceaccount=kube-system:default
echo "Sleeping to wait for Tiller to start..."
sleep 20
helm install svc-cat/catalog \
    --name catalog --namespace catalog
