# **Terraform Deployment Documentation**

This Folder consists of the code-setup required for the creation of VNET, AKS, KeyVault, ACR .

---

### **Directory Structure**

```
├── main.tf         # Entry point for the deployment
├── providers.tf    # Azure provider configuration
├── variables.tf    # Input variables
├── outputs.tf      # Outputs for sharing resource information
├── terraform.md    # Documentation file
└── modules/        # Directory containing reusable Terraform modules
    ├── aks/        # AKS module 
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   ├── locals.tf
    ├── acr/        # ACR module
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    ├── keyvault/   # Key Vault module
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    ├── vnet/       # VNet module
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
```

---

### *Few Important aspects to be mentioned used here in Terraform*

**MODULES** : 
The terraform code is written in Modules format. Modules are used to keep the code less complex and also reusuability of similar resource blocks for multiple scenarios.

**PROVIDERS** :
Providers are necessary for interaction of terraform with Azure cloud. Here I have highlighted the scenario of deploying resources in multiple subscriptions using the provider alias concept.

**FUNCTIONS** :
I have highlighted functions like *string interpolation , format, count, looping using for_each* to showcase their usage in certain possible scenarios.

**OUTPUT** :
After creation of resources their respective FQDN, IDs can be showcased using the outputs.tf file.

**AZURE-TERRAFORM_PIPELINE** : 
I have also created a simple azure yaml pipeline stating how the flow should be for a single environment.