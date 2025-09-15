# SkyCluster Helm Charts

Please follow the instruction on [SkyCluster docs](https://skycluster.io) to install the charts.

```bash
helm create skycluster

helm repo add skycluster https://skycluster.io/charts
helm repo list
helm repo update
```

To generate the template manually:

```bash
helm template . -f values.yaml | kubectl apply -f -
```

To package chart:

```bash
helm package skycluster
# This creates a skycluster-0.1.0.tgz package.
helm package skycluster-crds

# Place the package into /charts within skycluster.io

# Within the root folder create the index.yaml
# there is one index.yaml for all charts
OUT=/home/ubuntu/skycluster-project/skycluster-docs/_build/html/charts
helm repo index $OUT --url https://skycluster.io/charts
# Commit index.yaml and generated package

# testing
helm repo add test-skycluster http://172.17.0.2:8000/charts
helm repo add test-skycluster-crds http://172.17.0.2:8000/charts
# production
helm repo add skycluster https://skycluster.io/charts
helm repo add skycluster-crds https://skycluster.io/charts
helm repo list

helm repo update
helm search repo test-skycluster
```