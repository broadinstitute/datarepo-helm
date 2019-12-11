# oidc-proxy

## Chart Details
This chart deploys a datarepo ui into a Kubernetes namespace

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release datarepo-helm/oidc-proxy
```

## Deleting the Charts

Delete the Helm deployment as normal

```
$ helm delete my-release
```

## Parameters

The following tables lists the configurable parameters of the oidc-proxy chart and their default values.

|                   Parameter                   |                                                                                Description                                                                                |                            Default                            |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `replicaCount`                        | oidc-proxy pods to deploy registry                                                                                                                                              | `1`                                                         |
| `image.repository`                        | container image repository registry                                                                                                                                              | `broadinstitute/openidc-proxy`                                                         |
| `image.version`                        | oidc-proxy container image version registry                                                                                                                                              | `bernick_tcell`                                                         |
| `image.pullPolicy`                        | Kubernetes image pullPolicy registry                                                                                                                                              | `IfNotPresent`                                                         |
| `containers.port`                        | oidc-proxy proxy container port registry                                                                                                                                              | `80`                                                         |
| `env.proxyUrl`                        | oidc-proxy proxy location for datarepo-ui URI page registry                                                                                                                                              | `nil`                                                         |
| `env.proxyUrl2`                        | oidc-proxy proxy location for datarepo-ui URI /api page registry                                                                                                                                              | `nil`                                                         |
| `env.proxyUrl2`                        | oidc-proxy proxy location for datarepo-ui URI /register page registry                                                                                                                                              | `false`                                                         |
| `env.logLevel`                        | oidc-proxy proxy log apache logLevel registry                                                                                                                                              | `debug`                                                         |
| `env.serverName`                        | oidc-proxy proxy apache serverName registry                                                                                                                                              | `nil`                                                         |
| `env.remoteUserClaim`                        | remoteUserClaim registry                                                                                                                                              | `sub`                                                         |
| `env.enableStackdriver`                        | enableStackdriver on pod registry                                                                                                                                              | `yes`                                                         |
| `env.filter2`                        | Apache log filter2 registry                                                                                                                                              | `AddOutputFilterByType DEFLATE application/json text/plain text/html application/javascript application/x-javascript`                                                         |
| `serviceAccount.create`                        | Boolean to create a deployment serviceAccount registry                                                                                                                                              | `false`                                                         |
| `serviceAccount.name`                        | Use existing serviceAccount for deployment or create specific name serviceAccount registry                                                                                                                                              | `nil`                                                         |
| `service.type`                        | Service ip type registry                                                                                                                                              | `ClusterIP`                                                         |
| `service.port`                        | Service port registry                                                                                                                                              | `80`                                                         |
| `rbac.create`                        | Create RBAC policies and roles registry                                                                                                                                              | `false`                                                         |
| `ingress.enabled`                        | Boolean to create ingress registry                                                                                                                                              | `true`                                                         |
| `ingress.annotations.globalStaticIpName`                        | Name of the globalStaticIpName in GCP registry                                                                                                                                              | `nil`                                                         |
| `ingress.annotations.ingressAllowHttp`                        | Ingress Boolean to disable http externally registry                                                                                                                                              | `false`                                                         |
| `ingress.servicePort`                        | Ingress servicePort registry                                                                                                                                              | `http`                                                         |
| `secretsgeneric.enabled`                        | Boolean to enable plain text passwords to be pasted in via a values.yaml registry                                                                                                                                              | `true`                                                         |
| `secretsgeneric.tlsKey`                        | secrets config value for TLS key registry                                                                                                                                              | `nil`                                                         |
| `secretsgeneric.tlsCert`                        | secrets config value for TLS Cert registry                                                                                                                                              | `nil`                                                         |
