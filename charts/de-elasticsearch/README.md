Deploys the [official elastic search helm chart](https://github.com/elastic/helm-charts/tree/v7.10.2/elasticsearch)
as a sub chart. 

to install:
`helm install --debug elastic de-elasticsearch --namespace <namespace>`

to uninstall:
`helm uninstall --debug elastic de-elasticsearch --namespace <namespace>`