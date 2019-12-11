# Datarepo-ui

## Chart Details
This chart deploys a datarepo ui into a Kubernetes namespace

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release datarepo-helm/datarepo-ui
```

## Deleting the Charts

Delete the Helm deployment as normal

```
$ helm delete my-release
```

## Parameters

The following tables lists the configurable parameters of the Datarepo-ui chart and their default values.

|                   Parameter                   |                                                                                Description                                                                                |                            Default                            |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `replicaCount`                        | datarepo-ui pods to deploy registry                                                                                                                                              | `1`                                                         |
| `image.repository`                        | container image repository registry                                                                                                                                              | `gcr.io/broad-jade-dev/jade-data-repo`                                                         |
| `image.version`                        | datarepo-ui container image version registry                                                                                                                                              | `latest`                                                         |
| `image.pullPolicy`                        | Kubernetes image pullPolicy registry                                                                                                                                              | `IfNotPresent`                                                         |
| `proxyPass.status`                        | datarepo-ui proxy location for datarepo-api URI status page registry                                                                                                                                              | `nil`                                                         |
| `proxyPass.swagger`                        | datarepo-ui proxy location for datarepo-api URI Swagger page registry                                                                                                                                              | `nil`                                                         |
| `proxyPass.api`                        | datarepo-ui proxy location for datarepo-api URI api page registry                                                                                                                                              | `nil`                                                         |
| `serviceAccount.create`                        | Boolean to create a deployment serviceAccount registry                                                                                                                                              | `false`                                                         |
| `serviceAccount.name`                        | Use existing serviceAccount for deployment or create specific name serviceAccount registry                                                                                                                                              | `nil`                                                         |
| `service.type`                        | Service ip type registry                                                                                                                                              | `ClusterIP`                                                         |
| `service.port`                        | Service port registry                                                                                                                                              | `80`                                                         |
