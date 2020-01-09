# create-vault-crd-secrets

## Chart Details
This chart rendered vault secrets from Hashicrop vault server and deploys the values as Kubernetes secret

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release datarepo-helm/create-vault-crd-secrets
```

## Deleting the Charts

Delete the Helm deployment as normal

```
$ helm delete my-release
```

## Parameters

The following tables lists the configurable parameters of the create-vault-crd-secrets chart and their default values.

|                   Parameter                   |                                                                                Description                                                                                |                            Default                            |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `enableVaultCrd`                        | Boolean to install vault-crd registry                                                                                                                                              | `false`                                                         |
| `serviceAccount.create`                        | Boolean to create a deployment serviceAccount registry                                                                                                                                              | `false`                                                         |
| `serviceAccount.name`                        | Use existing serviceAccount for deployment or create specific name serviceAccount registry                                                                                                                                              | `nil`                                                         |                                                        |
| `rbac.create`                        | Create RBAC policies and roles registry                                                                                                                                              | `false`                                                         |
