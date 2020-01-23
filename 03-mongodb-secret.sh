#! /usr/bin/env bash

kubectl apply -f secret.yaml -n atlas

kubectl describe secrets/atlas-service-broker-auth -n atlas