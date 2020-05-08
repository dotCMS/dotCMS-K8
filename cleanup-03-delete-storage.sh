#!/bin/bash


gcloud compute disks delete dbdata  --zone us-central1-c --quiet
gcloud compute disks delete nfsdata --zone us-central1-c --quiet
gcloud compute disks delete esdata  --zone us-central1-c --quiet




