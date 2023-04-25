### Hello Porter deployment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fstevebelton%2Fporter_demo%2Fmain%2Ftest.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Azure CNAB/Porter/ACI Test Deployment (test5.json)
Deploys a bundle in Azure that contains an arm template to deploy using AZ/ARM Mixins
Created to test parameter & credential pass-through from an ARM template->ACI Deployment->Bundle->ARM Template Deployment.

See the [test5 folder](https://github.com/stevebelton/porter/tree/main/test5) for bundle files, etc.)

Makes use of the following Mixins
- ```AZ```
- ```ARM```
- ```exec```

Uses the [Azure CNAB Driver](https://github.com/deislabs/cnab-azure-driver) (**cnabquickstarts.azurecr.io/cnabarmdriver:0.25.0**) and the [Azure CNAB/ARM Converter](https://github.com/endjin/CNAB.ARM-Converter) to deploy via Azure and ACI.

### Deploy an Azure VNET as a single resource
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fstevebelton%2Fporter_demo%2Fmain%2Fdemo3.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Deploy an Azure VNET as an Azure Deployment
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fstevebelton%2Fporter_demo%2Fmain%2Fdemo2.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Deploy Test5
<a href="https://raw.githubusercontent.com/KurtSchenk/porter_demo/ks-experiment/test5.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


### Deploy FixMe
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fonel95%2Fporter_demo%2Fmain%2Ffixmedeploy.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>
