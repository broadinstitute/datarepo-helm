# create-secret-manager-secret

## Chart Details
This chart will install a custom CRD [secrets-manger](https://github.com/tuenti/secrets-manager)
## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release datarepo-helm/create-secret-manager-secret
```

## Deleting the Charts

Delete the Helm deployment

```
$ helm delete my-release
```

## Parameters

The following tables lists the configurable parameters of the create-secret-manager-secret chart and their default values.

|                   Parameter                   |                                                                                Description                                                                                |                            Default                            |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `install-secrets-manager.install`                        | this will enable the dependency install from the chart.yaml registry                                                                                                                                              | `false`                                                         |
| `secretName`                        | Name of the kubeSecret when rendered registry                                                                                                                                              | `nil`                                                         |
| `vals.path`                        | vault path to secret                                                                                                                                              | `nil`                                                         |
| `vals.encoding`                        | If secret in vault is already base64 encoded use value `base64` registry                                                                                                                                              | `nil`                                                         |
| `vals.vaultKey`                        | vault key to be used as kubeSecret registry                                                                                                                                              | `nil`                                                         |


## Example of multi secret
```
---
secrets:
- secretName: jade-sa
  vals:
  - kubeSecretKey:  datareposerviceaccount
    path:  secret/fakepath/datarepo/dev/helm-sa-key
    vaultKey:  datareposerviceaccount
- secretName: sqlproxy
  vals:
  - kubeSecretKey:  sa
    path:  secret/fakepath/datarepo/dev/sqlproxy-sa-ms-b64
    encoding: base64
    vaultKey:  sa
- secretName: database-pwd-ms
  vals:
  - kubeSecretKey:  datarepopassword
    path:  secret/fakepath/datarepo/dev/helm-datarepodb-dev-ms
    vaultKey:  datarepopassword
  - kubeSecretKey:  stairwaypassword
    path:  secret/fakepath/datarepo/dev/helm-datarepodb-dev-ms
    vaultKey:  stairwaypassword
- secretName: oidc-tls-key
  vals:
  - kubeSecretKey:  tls.key
    path:  secret/fakepath/datarepo/fakepath/helm-tls-certs
    vaultKey:  tls.key
  - kubeSecretKey:  tls.crt
    path:  secret/fakepath/datarepo/fakepath/helm-tls-certs
    vaultKey:  tls.crt
```
