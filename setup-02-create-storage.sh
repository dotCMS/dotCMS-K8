#!/bin/bash

# Create gce disks:
gcloud compute disks create --size=200GB dbdata --zone us-central1-b
gcloud compute disks create --size=200GB nfsdata --zone us-central1-b
gcloud compute disks create --size=200GB esdata --zone us-central1-b
