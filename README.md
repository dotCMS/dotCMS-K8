# dotCMS Kubernetes Example

## Prerequisites ##
1. Have a Google Cloud Platform Account with ability to start up at least 12 cpus in the us-central1-c location (or custom location if you are modifying scripts).  This needs to be enabled or you need to reduce the number of instances specified in the setup-01-create-cluster.sh file.
2. Have kubectl installed locally - [https://kubernetes.io/docs/tasks/tools/install-kubectl/](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
3. Have `go` installed - used to merge the pre-req template
3. Have the command line utility `jq` installed, to parse json responses
3. Have gcloud command line utility installed locally and signed into your GCP account - [https://cloud.google.com/sdk/install](https://cloud.google.com/sdk/install)
4. Enable use of APIs on your GCP account.  The gcloud command line will prompt for this if they are not enabled.
5. Set default GCP location to `us-central1-c` or modify the scripts to use your default location.  [https://cloud.google.com/sdk/docs/quickstarts](https://cloud.google.com/sdk/docs/quickstarts)
6. Place a license pack file (license.zip) in this directory.  If you do not have a license pack, please contact support (email:support@dotcms.com or use [support portal](https://helpdesk.dotcms.com/))

## Instructions ##
1. Ensure a current `license.zip` file is located in this directory.
2. Run `./setup.sh`
3. dotCMS is probably still initiallizing but you can start interacting with the cluster now.  Some examples below.
4. Once finished, you can run `./cleanup.sh` to shutdown cluster and the associated storage - **WARNING** - once the cleanup script is run, all persistent data will be gone.

## Example Interactions ##

### Access dotcms
1. run `kubectl get svc`
2. locate 'External IP' for haproxy-svc
3. Open page in browser http://[External IP]/
4. If you receive a 503 Service Unavailable, dotCMS may still be initializing. 
5. To tail the dotCMS logs, use the `kubectl logs` command , something like `kubectl logs-lapp=dotcms -f`



### Access Hazelcast Mancenter
1. run 'kubectl get svc'
2. locate 'External IP' for hazelcast-mancenter-svc
3. Open page in browser http://[External IP]:8080/mancenter

##### Credit
This repo was initiated from the good work done by Brent Griffin : 
https://dotcms.com/blog/post/container-orchestration-running-dotcms-in-kubernetes

