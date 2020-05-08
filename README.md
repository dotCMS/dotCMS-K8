# dotCMS Kubernetes Demo
dotCMS Kubernetes Demo Artifacts

## Prerequisites ##
1. Have a Google Cloud Platform Account with ability to start up at least 12 cpus in the us-central1-c location (or custom location if you are modifying scripts).  This needs to be enabled or you need to reduce the number of instances specified in the setup-01-create-cluster.sh file.
2. Have kubectl installed locally - [https://kubernetes.io/docs/tasks/tools/install-kubectl/](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
3. Have gcloud command line utility installed locally and signed into your GCP account - [https://cloud.google.com/sdk/install](https://cloud.google.com/sdk/install)
4. Enable use of APIs on your GCP account.  I believe the gcloud command line will prompt for this if they are not enabled.
5. Set default GCP location to `us-central1-c` or modify the scripts to use your default location.  [https://cloud.google.com/sdk/docs/quickstarts](https://cloud.google.com/sdk/docs/quickstarts)
6. Place a license pack file (license.zip) in this directory.  If you do not have a license pack, please contact support (email:support@dotcms.com or use [support portal](https://helpdesk.dotcms.com/))

## Instructions ##
1. Ensure a current `license.zip` file is located in this directory.
2. Run `./setup.sh`
3. dotCMS is probably still initiallizing but you can start interacting with the cluster now.  Some examples below.
4. Once finished, you can run `./cleanup.sh` to shutdown cluster and the associated storage - **WARNING** - once the cleanup script is run, all persistent data will be gone.

## Example Interactions ##

## Kube
`kubectl get svc`

`kubectl get pods`

`kubectl logs -f --prefix -lapp=dotcms`

`kubectl logs -f --prefix -lapp=haproxy`

`kubectl logs -f --prefix -lapp=postgres`

`kubectl exec -it  {podname} -- /bin/bash`

`kubectl apply -f deployment.yaml`


### Access dotcms
1. run `kubectl get svc`
2. locate 'External IP' for haproxy-svc
3. Open page in browser http://[External IP]/
4. If you receive a 503 Service Unavailable, dotCMS may still be initializing.  You can just wait and refresh or if you want to view the logs, you can use kubectl logs command to view the logs for the dotcms pod.



