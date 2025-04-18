# SkyCluster Helm Charts

Please follow the instruction on [SkyCluster docs](https://skycluster.io) to install the charts.

```bash
helm repo add skycluster https://skycluster.io/charts
helm repo list
helm repo update
```

To generate the template manually:

```bash
helm template . -f values.yaml | kubectl apply -f -

# You can manually set variables:
helm template . --set postInstall=1 -f values/settings-savi-many-zones.yaml | kubectl apply -f -
```