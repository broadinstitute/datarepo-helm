Deploys the [official elastic search helm chart](https://github.com/elastic/helm-charts/tree/f01036e04be9aa62afa52f052c4e600c9e3e1da7/elasticsearch)
as a sub chart. 

to install:
`helm install --debug elastic de-elasticsearch --namespace <namespace>`

to uninstall:
`helm uninstall --debug elastic de-elasticsearch --namespace <namespace>`