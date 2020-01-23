#! /usr/bin/env bash
#
# (3) Create the namespace for the svcat deployment.
kubectl create namespace atlas

#
# Sanity check
kubectl get namespace

# 
#  Install the Atlas Open Service Broker
#
kubectl apply -f deployment-and-service.yaml -n atlas
