#! /usr/bin/env bash

# 
# 
# Register the Atlas Open Service Broker with the Kubernetes Service Catalog
#
kubectl apply -f service-broker.yaml -n atlas

svcat get brokers -n atlas

##
# Check our Work
##
svcat describe broker atlas-service-broker -n atlas

#
# Deploy ReplicaSet
#
kubectl apply -f replica-set.yaml

#
# How is the deployment going
#
svcat describe instance my-atlas-cluster -n atlas
