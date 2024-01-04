# Datarepo

## Chart Details
This chart will do the following:
- Deploy an entire Datarepo
- includes:
  - [datarepo-api](https://github.com/broadinstitute/datarepo-helm/tree/master/charts/datarepo-api)
  - [datarepo-ui](https://github.com/broadinstitute/datarepo-helm/tree/master/charts/datarepo-ui)
  - [oidc-proxy](https://github.com/broadinstitute/datarepo-helm/tree/master/charts/oidc-proxy)
  - [gcloud-sqlproxy](https://github.com/broadinstitute/datarepo-helm/tree/master/charts/gcloud-sqlproxy)
  - [Postgresql](https://github.com/helm/charts/tree/master/stable/postgresql)

## Prerequisite
- [datarepo-api](https://github.com/broadinstitute/datarepo-helm/tree/master/charts/datarepo-api)
- [datarepo-ui](https://github.com/broadinstitute/datarepo-helm/tree/master/charts/datarepo-ui)
- [oidc-proxy](https://github.com/broadinstitute/datarepo-helm/tree/master/charts/oidc-proxy)
- [gcloud-sqlproxy](https://github.com/broadinstitute/datarepo-helm/tree/master/charts/gcloud-sqlproxy)
- Postgresql Database
  - This can be local to a Kubernetes namespace or external
    - Internal postgresql:
      - deployed to namespace via [postgresql helm chart](https://github.com/helm/charts/tree/master/stable/postgresql)
    - external  postgresql:
      - Any database outside of the namespace, this will require [gcloud-sqlproxy](https://github.com/broadinstitute/datarepo-helm/tree/master/charts/gcloud-sqlproxy) to point at the external database


## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release datarepo-helm/datarepo
```

## Deleting the Charts

Delete the Helm deployment as normal

```
$ helm delete my-release
```
