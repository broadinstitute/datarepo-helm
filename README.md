# datarepo-helm
A helm repo for Datarepo from Broad Data Science Platforms Group

## How Do I install the repo
```
helm repo add datarepo-helm https://broadinstitute.github.io/datarepo-helm
helm repo update
```
## How Do I Install These Charts?

Just `helm install datarepo-helm/<chart>`. This is the default repository for Helm which is located at https://broadinstitute.github.io/datarepo-helm/ and is installed by default.

For more information on using Helm, refer to the [Helm documentation](https://github.com/kubernetes/helm#docs).

## Updating Helm Charts via the Chart Releaser action

1. Edit chart and bump `chart.yaml` version
  - This repo contain a couple of umbrella chart so how many PRs you make will depend on that

#### Example chart bump
```
apiVersion: v2
name: datarepo-api
description: A Helm chart to deploy datarepo api server for Kubernetes
type: application
version: 0.0.10  --> 0.0.11
appVersion: 0.0.10 --> 0.0.11
```
2. Cut PR and assign Smark88

  Locally run the following post action success
-  `helm repo update`
-  `helm search repo datarepo-helm`

To check for the new charts locally
```
▶ helm repo update                       
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "datarepo-helm" chart repository
Update Complete. ⎈ Happy Helming!⎈

                                                                                39m ⚑  
▶ helm search repo datarepo-helm         
NAME                                            CHART VERSION   APP VERSION     DESCRIPTION                                       
datarepo-helm/datarepo-api                      0.0.11          0.0.11          A Helm chart to deploy datarepo api server for ...                  
datarepo-helm/datarepo                          0.1.3           0.1.3           A Helm chart to deploy an entire datarepo         
...
```

## Optional: Umbrella chart edit

3. If umbrella chart needs bumping like datarepo
  - merge step 1-2s PR then as that is a dependency of the umbrella

#### Umbrella chart.yaml version bump
```
...

version: 0.1.3 --> 0.1.4
appVersion: 0.1.3 --> 0.1.4

...

# dependencies
dependencies:
- name: datarepo-api
  version: 0.0.10 --> 0.0.11
  repository: https://broadinstitute.github.io/datarepo-helm/
  condition: datarepo-api.enabled

...
...
```
Here we bumped the top level umbrella and the underlying datarepo-api chart version from steps 1-2
The umbrella chart requires `chart.lock` be updated for the action to sucessfully run so run
`Helm package charts/datarepo --destination .deploy -u`
This shold edit the checksums in the `chart.lock` file

git add .
`datarepo/chart.lock`
`datarepo/chart.yaml`

4. Cut a PR for the new umbrella charts
Locally run the following post action success
`helm repo update`
`helm search repo datarepo-helm`
To check for the new charts locally
```
▶ helm repo update                       
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "datarepo-helm" chart repository
Update Complete. ⎈ Happy Helming!⎈

                                                                              39m ⚑  
▶ helm search repo datarepo-helm         
NAME                                            CHART VERSION   APP VERSION     DESCRIPTION                                       
datarepo-helm/datarepo-api                      0.0.11          0.0.11          A Helm chart to deploy datarepo api server for ...                  
datarepo-helm/datarepo                          0.1.3           0.1.3           A Helm chart to deploy an entire datarepo         
...
```
5. Enjoy your new Chart version and edit your [Datarepo-helm-definitions](https://github.com/broadinstitute/datarepo-helm-definitions) to use your newly deployed chart
