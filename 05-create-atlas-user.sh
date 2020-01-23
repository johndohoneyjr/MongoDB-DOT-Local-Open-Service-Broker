#! /usr/bin/env bash


echo
echo
echo "Make sure your Mongo Atlas ReplicaSet has deployed"
echo
echo "Be sure to load your databses in Atlas at this point and update the dbs and"
echo "collection information in atlas-user.yaml first before running this file."
echo
kubectl apply -f atlas-user-test.yaml

svcat describe binding jdohoney -n atlas