#!/bin/bash


kubectl delete service --all
kubectl delete deployment --all

kubectl delete sts --all
kubectl delete pods --all
kubectl delete pvc --all
kubectl delete pv --all



./cleanup-01-undeploy.sh
./cleanup-02-remove-prereq.sh
./cleanup-03-delete-storage.sh
./cleanup-04-delete-cluster.sh
