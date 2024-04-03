# serviceaccount-psp

## Chart Details
This chart deploys a datarepo ui into a Kubernetes namespace

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release datarepo-helm/serviceaccount-psp
```

## Deleting the Charts

Delete the Helm deployment as normal

```
$ helm delete my-release
```

## Parameters

The following tables lists the configurable parameters of the serviceaccount-psp chart and their default values.

|                   Parameter                   |                                                                                Description                                                                                |                            Default                            |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `serviceAccount.create`                        | Boolean to create a deployment serviceAccount registry                                                                                                                                              | `false`                                                         |
| `serviceAccount.name`                        | Use existing serviceAccount for deployment or create specific name serviceAccount registry                                                                                                                                              | `nil`                                                         |
