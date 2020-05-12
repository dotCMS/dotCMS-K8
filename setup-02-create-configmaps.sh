#!/bin/bash

licensePack=./license.zip


touch $licensePack

# make license pack available
kubectl create configmap dotcmslicensepack --from-file=$licensePack

# make SSL Cert available
kubectl create configmap dotcms.ssl.cert --from-file=./cert.pem