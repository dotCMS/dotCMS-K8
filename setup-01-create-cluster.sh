#!/bin/bash

gcloud container clusters create --zone us-central1-b --machine-type=n1-standard-4 --num-nodes=3 dotcms-demo-cluster
