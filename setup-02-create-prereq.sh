#!/bin/bash


# make license pack available
kubectl create configmap dotcmslicensepack --from-file=./license.zip

# make SSL Cert available
kubectl create configmap dotcms.ssl.cert --from-file=./cert.pem