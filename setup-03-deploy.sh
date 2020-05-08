#!/bin/bash

# Create deployment:

kubectl apply -f yaml/10-postgresql.yaml      
kubectl apply -f yaml/20-nfsserver.yaml       
kubectl apply -f yaml/30-elasticsearch.yaml   
kubectl apply -f yaml/40-dotcms.yaml          
kubectl apply -f yaml/50-haproxy.yaml