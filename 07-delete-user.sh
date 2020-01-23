#! /usr/bin/env bash

# Show Database Access | Users, then add binding

kubectl delete servicebindings jdohoney -n atlas 

svcat describe instance jdohoney -n atlas 

