# Readme

1. First using `values.yaml` generate the settings for OS Providers:

```bash
# This generates the mappings object located in the parent folder
helm template . --set generateConfigMaps=1 > ../values/settings-savi-many-zones.yaml

# Once the settings-savi-many-zones.yaml is created, go to the parent helm folder and
# generate the templates for ConfigMaps associated with providers in settings-savi-many-zones.yaml

# When ready to create actual SkyProviders object, try the following command
# This generates yaml files for creating SkyProvider(s)
# helm template . --set generateTemplate.skyprovider=1 
```

