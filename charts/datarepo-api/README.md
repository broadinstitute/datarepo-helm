# Datarepo-api

## Chart Details
This chart deploys a datarepo api into a Kubernetes namespace

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release datarepo-helm/datarepo-api
```

## Deleting the Charts

Delete the Helm deployment as normal

```
$ helm delete my-release
```

## Parameters

The following tables lists the configurable parameters of the Datarepo-api chart and their default values.

| Parameter                                              | Description                                                                     |                            Default                            |
|--------------------------------------------------------|---------------------------------------------------------------------------------|---------------------------------------------------------------|
| `replicaCount`                                         | datarepo-api pods to deploy registry                                            | `1`                                                         |
| `image.repository`                                     | container image repository registry                                             | `gcr.io/broad-jade-dev/jade-data-repo`                                                         |
| `image.version`                                        | datarepo-api container image version registry                                   | `latest`                                                         |
| `image.pullPolicy`                                     | Kubernetes image pullPolicy registry                                            | `IfNotPresent`                                                         |
| `image.port`                                           | datarepo-api pod ports registry                                                 | `8080`                                                         |
| `env.serverContextpath`                                | environment var serverContextpath registry                                      | `nil`                                                         |
| `env.serverPort`                                       | environment var serverPort registry                                             | `nil`                                                         |
| `env.springDatasourceTomcatTestOnBorrow`               | environment var springDatasourceTomcatTestOnBorrow registry                     | `nil`                                                         |
| `env.springDatasourceTomcatValidationQuery`            | environment var springDatasourceTomcatValidationQuery registry                  | `nil`                                                         |
| `env.springJacksonSerializationWriteDatesAsTimestamps` | environment var springJacksonSerializationWriteDatesAsTimestamps registry       | `nil`                                                         |
| `env.springLiquibaseEnabled`                           | environment var springLiquibaseEnabled registry                                 | `nil`                                                         |
| `env.springfoxDocumentationSwaggerV2Path`              | environment var springfoxDocumentationSwaggerV2Path registry                    | `nil`                                                         |
| `env.dbMigrateDropallonstart`                          | environment var dbMigrateDropallonstart registry                                | `nil`                                                         |
| `env.dbMigrateUpdateallonstart`                        | environment var dbMigrateUpdateallonstart registry                              | `nil`                                                         |
| `env.dbDatarepoUri`                                    | environment var dbDatarepoUri registry                                          | `nil`                                                         |
| `env.dbDatarepoUsername`                               | environment var dbDatarepoUsername registry                                     | `nil`                                                         |
| `env.dbDatarepoPassword`                               | environment var dbDatarepoPassword registry                                     | `nil`                                                         |
| `env.dbDatarepoChangesetfile`                          | environment var dbDatarepoChangesetfile registry                                | `nil`                                                         |
| `env.dbStairwayUri`                                    | environment var dbStairwayUri registry                                          | `nil`                                                         |
| `env.dbStairwayUsername`                               | environment var dbStairwayUsername registry                                     | `nil`                                                         |
| `env.dbStairwayPassword`                               | environment var dbStairwayPassword registry                                     | `nil`                                                         |
| `env.dbStairwayChangesetfile`                          | environment var dbStairwayChangesetfile registry                                | `nil`                                                         |
| `env.dbStairwayForceclean`                             | environment var dbStairwayForceclean registry                                   | `nil`                                                         |
| `env.oauthClientid`                                    | environment var oauthClientid registry                                          | `nil`                                                         |
| `env.oauthSchemename`                                  | environment var oauthSchemename registry                                        | `nil`                                                         |
| `env.oauthLoginendpoint`                               | environment var oauthLoginendpoint registry                                     | `nil`                                                         |
| `env.oauthScopes`                                      | environment var oauthScopes registry                                            | `nil`                                                         |
| `env.datarepoResourceid`                               | environment var datarepoResourceid registry                                     | `nil`                                                         |
| `env.datarepoUseremail`                                | environment var datarepoUseremail registry                                      | `nil`                                                         |
| `env.datarepoDnsname`                                  | environment var datarepoDnsname registry                                        | `nil`                                                         |
| `env.datarepoUserid`                                   | environment var datarepoUserid registry                                         | `nil`                                                         |
| `env.datarepoMaxstairwaythreads`                       | environment var datarepoMaxstairwaythreads registry                             | `nil`                                                         |
| `env.datarepoGcsBucket`                                | environment var datarepoGcsBucket registry                                      | `nil`                                                         |
| `env.datarepoGcsRegion`                                | environment var datarepoGcsRegion registry                                      | `nil`                                                         |
| `env.datarepoGcsConnecttimeoutseconds`                 | environment var datarepoGcsConnecttimeoutseconds registry                       | `nil`                                                         |
| `env.datarepoGcsReadtimeoutseconds`                    | environment var datarepoGcsReadtimeoutseconds registry                          | `nil`                                                         |
| `env.samBasepath`                                      | environment var samBasepath registry                                            | `nil`                                                         |
| `env.samStewardsgroupemail`                            | environment var samStewardsgroupemail registry                                  | `nil`                                                         |
| `env.samRetryinitialwaitseconds`                       | environment var samRetryinitialwaitseconds registry                             | `nil`                                                         |
| `env.samRetrymaximumwaitseconds`                       | environment var samRetrymaximumwaitseconds registry                             | `nil`                                                         |
| `env.samOperationtimeoutseconds`                       | environment var samOperationtimeoutseconds registry                             | `nil`                                                         |
| `env.googleProjectid`                                  | environment var googleProjectid registry                                        | `nil`                                                         |
| `env.googleApplicationname`                            | environment var googleApplicationname registry                                  | `nil`                                                         |
| `env.googleProjectcreatetimeoutseconds`                | environment var googleProjectcreatetimeoutseconds registry                      | `nil`                                                         |
| `env.googleCorebillingaccount`                         | environment var googleCorebillingaccount registry                               | `nil`                                                         |
| `env.googleParentresourcetype`                         | environment var googleParentresourcetype registry                               | `nil`                                                         |
| `env.googleParentresourceid`                           | environment var googleParentresourceid registry                                 | `nil`                                                         |
| `nameOverride`                                         | nameOverride for deployment registry                                            | `nil`                                                         |
| `fullnameOverride`                                     | fullname Override for deployment registry                                       | `nil`                                                         |
| `serviceAccount.create`                                | Create a serviceAccount for deployment registry                                 | `false`                                                         |
| `serviceAccount.name`                                  | name of existing serviceAccount to deploy from registry                         | `nil`                                                         |
| `rbac.create`                                          | create RBAC policies for deploy registry                                        | `false`                                                         |
| `service.port`                                         | port to expose on pod registry                                                  | `8080`                                                         |
| `service.type`                                         | pod ip type registry                                                            | `ClusterIP`                                                                                                                 |
| `secretsgeneric.datarepoPassword`                      | Password for the datarepo database registry                                     | `nil`                                                         |
| `secretsgeneric.stairwayPassword`                      | Password for the stairway database registry                                     | `nil`                                                         |
| `secretsgeneric.credentialFileJson`                    | GCP serviceAccount Json for datarepo SA registry                                | `nil`                                                         |
| `secretsgeneric.applicationSecret`                     | Azure application secret                                                        | `nil`                                                         |
| `secretsgeneric.synapseUser`                           | Azure synapse admin username                                                    | `nil`                                                         |
| `secretsgeneric.synapsePassword`                       | Azure synapse admin password                                                    | `nil`                                                         |
| `secretsgeneric.synapseEncryptionKey`                  | Azure synapse encryption key                                                    | `nil`                                                         |
| `existingSecretDB`                                     | Name of an existing secret you would like to use registry                       | `nil`                                                         |
| `existingDatarepoDbSecretKey`                          | The key in the existing secret that stores the Datarepo DB credentials          | `nil`                                                         |
| `existingStairwayDbSecretKey`                          | The key in the existing secret that stores the stairway DB credentials          | `nil`                                                         |
| `existingServiceAccountSecretKey`                      | The key in the existing secret that stores the GCP Service account credentials  | `nil`                                                         |
| `existingSecretAzure`                                  | Name of an existing secret that store Azure information                         | `nil`                                                         |
| `existingApplicationSecretSecretKey`                   | The key in the existing secret that stores the Azure application secret         | `nil`                                                         |
| `existingSynapseUserSecretKey`                         | The key in the existing secret that stores the azure synapse sql admin username | `nil`                                                         |
| `existingSynapsePasswordSecretKey`                     | The key in the existing secret that stores the azure synapse sql admin password | `nil`                                                         |
| `existingSynapseEncryptionKeySecretKey`                | The key in the existing secret that stores the azure synapse sql encryption key | `nil`                                                         |
