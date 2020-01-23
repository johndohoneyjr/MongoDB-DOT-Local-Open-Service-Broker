#! /usr/bin/env bash
svcat describe instance my-atlas-cluster -n atlas
#
#
echo
echo
echo "Get User Name"
USERNAME=`kubectl get secret jdohoney -n atlas -o json | jq .data.username`
echo $USERNAME | sed 's/"//g' | base64 --decode
LUSERNAME=`echo $USERNAME | sed 's/"//g' | base64 --decode`
echo
echo
echo
echo "Get User Password"
PASSWORD=`kubectl get secret jdohoney -n atlas -o json | jq .data.password`
echo $PASSWORD | sed 's/"//g' |  base64 --decode
echo
echo
echo
echo "Get mongo connection URI"
URI=`kubectl get secret jdohoney -n atlas -o json | jq .data.uri`
echo $URI | sed 's/"//g' |  base64 --decode
LURI=`echo $URI | sed 's/"//g' |  base64 --decode`
find
echo
echo
echo "mongo $LURI  --username $LUSERNAME" | sed 's/"//g'
echo
echo "use the decoded password when prompted"
echo
echo "Connect to Compass"
