#!/bin/bash
# delete the deployments
kubectl delete -f yaml/50-haproxy.yaml
kubectl delete -f yaml/40-dotcms.yaml     
kubectl delete -f yaml/30-elasticsearch.yaml   
kubectl delete -f yaml/20-nfsserver.yaml     
kubectl delete -f yaml/10-postgresql.yaml      
  

     

