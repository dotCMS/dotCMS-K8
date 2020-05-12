# dotCMS Kubernetes Example
dotCMS Kubernetes Example Artifacts

## Prerequisites ##
1. Have a Google Cloud Platform Account.  This example uses 3 n1-standard-4. You can configure the instances and the availability zones which are specified in the `setup-01-create-cluster.sh` file.
2. Have kubectl installed locally - [https://kubernetes.io/docs/tasks/tools/install-kubectl/](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
3. Have gcloud command line utility installed locally and signed into your GCP account - [https://cloud.google.com/sdk/install](https://cloud.google.com/sdk/install)
4. Enable use of APIs on your GCP account.  The gcloud command line will prompt for this if they are not enabled.
5. Set default GCP location to `us-central1-b` or modify the scripts to use your default location.  [https://cloud.google.com/sdk/docs/quickstarts](https://cloud.google.com/sdk/docs/quickstarts)
6. If you are looking to scale dotCMS beyond 1 node, you will need a multi-server license pack in order to have the nodes discover each other.  Place the license pack file (license.zip) in this directory.  If you do not have a license pack, please contact sales info@dotcms.com (new customers) or support@dotcms.com (existing customers).

## Instructions ##
1. If you have a `license.zip`, place it in this directory.
2. Run `./setup.sh`
  - this will create a new 3node Kubernetes cluster, the configmaps of the license pack and ssl cert and apply the yaml files under ./yaml directory.  
3. dotCMS is probably still initiallizing but you can start interacting with the cluster now.  Some examples below.
4. Once finished, you can run `./cleanup.sh` to shutdown cluster and the associated storage - **WARNING** - once the cleanup script is run, all persistent data will be gone.


## To Access dotCMS
1. run `kubectl get svc`
2. locate 'External IP' for haproxy-svc
3. Open page in browser https://[External IP]/
4. If you receive a 503 Service Unavailable, dotCMS may still be initializing.  You can just wait and refresh or if you want to view the logs, you can use kubectl logs command to view the logs for the dotcms pod.


## Scaling dotCMS up
If you have a valid license pack file, e.g. license.zip, you can scale the dotCMS servers up.  This is done by changing replica value in the dotCMS template `yaml/40-dotcms.yaml`, e.g. to something like
```
spec:
  replicas: 3
```

## Notes
This example consists of 5 primary services:
1. Postgres DB - this is using Postgres's default docker image - the only customization is to the configured max_connections and shared_buffers.  You can update this to use a non-default username/password.
2. NFSServer - this template is taken from the Helm chart for the nfsserver-nfs-server-provisioner.  It create a new shareable StorageClass `nfs` useable by other pods when making a PersistantVolumeClaim 
3. Elasticsearch / Opendistro - this service uses the helm chart for an Opendistro elasticsearch cluster with Kibana attached.  You can find more information about how to use this template here: https://opendistro.github.io/for-elasticsearch-docs/docs/install/helm/
4. dotCMS - this template creates 1 or more dotCMS instances that connect to other services
5. HAProxy - this template creates the public IP address and a Load Balancer/SSL Termination using HAProxy 1.8 and has been tuned specifically for dotCMS.  The ssl cert that is applied is `cert.pem`.  If you want to install your own certificate, you can create a custom PEM file from your private.key/server.crt and the CA/root.crts.   


## Example Kubernetes Interactions ##

### Access kibana image for the dotCMS index
This command forwards traffic from your local computer to the kibana instance.  
`kubectl port-forward deployment/opendistro-es-kibana 5601`

Once this is done, you can access kibana by going to http://localhost:5601 and use admin/admin as your credientials.


`kubectl get svc`

`kubectl get pods`

`kubectl logs -f --prefix -lapp=dotcms`

`kubectl logs -f --prefix -lapp=haproxy`

`kubectl exec -it  {podname} -- /bin/bash`


