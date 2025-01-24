# **Pipeline Debugging**

### **Scenario** ###
*Debug a failing Azure DevOps pipeline with errors in environment variable configuration*

### **Solution** ###

Considering from the **AzureDevops YAML Pipeline Configuration** :

- Check the Pipeline logs first to see where the issue might be occuring.
- check the ENV parameters are correctly variablized, I mean the format.
- check all the ENV Variable Value are correctly added either under the **Variables** section either as Key, Value or is added in the respective **Variable Group** (mostly for non-sensitive data). For SENSITIVE data please the respective vaults refered , example **AZURE KEYVAULT**


Incase of  **ISSUE in AKS ENV**

- kubectl describe to check if the values are correctly populating.
- If referred to COnfigmaps or Secrets, *kubectl describe secrets/configmaps* to check if the values where correctly replaced from which the pod is referring from.
- In HELM, we can double check the valuesfile, if correctly variablized or values correctly configured.