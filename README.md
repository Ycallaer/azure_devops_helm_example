# azure_devops_helm_example
The following repo contains an example of how to build an Azure Devops Pipeline for helm.
The pipeline runs under the following conditions:
* Limited internet access during the build
* All artifacts are stored under an on-prem Jfrog instance
* Helm diff plugin to validate changes

# Docker
The docker image that is supplied will hold some common packages that can be used during the run.
This image will be used during the pipeline run, and hence must be uploaded to Jfrog before you can run it

# Helm and Helm diff
While helm can be installed during the release, this is not the case of helm diff.
Since our docker container runs with a specific user depending on the pool you choose, we install helm diff during the
build of the azure pipeline.
