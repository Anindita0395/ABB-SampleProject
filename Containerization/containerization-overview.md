# **CONTAINERIZATION**
---

### **Scenario**
This folder contains code for developing *Self Hosted Containerized Azure Linux based Agents* .

---

### **Tools Used**
- Integration with **GitHub**  for source code management.
- **Azure DevOps Pipelines** for creating CI/CD workflows.
- **Azure Keyvault** and **Variable Groups** for storing sensitive and non-sensitive data respectively.
- **DOCKER** for building Azure Devops Linux-based Agent images.
- **Azure Container Registry** for storing docker images.
- **Kubernetes** for container orchestration.
- **KEDA (Kubernetes Event-Driven Autoscaling)** for dynamic scaling of agents during high requests flow.
- **HELM** to deploy kubernetes resources.

---

In the azure-docker-build.yaml pipeline the following aspects are covered:

## **Continuous Integration / Continuous Deployment (CI/CD)**

### *Continuous Integration*
-  Any Code Commit will Trigger the pipeline to automatically build the Dockerfile and deploy it to DEV environment by default.
-  azure-docker-build.yaml is excluded from trigger to save from unnecessary runs.
-  For every Docker Build , uniqueID will be created using buildID and date for better versioning and traceability.

### *Continuous Deployment*
-  I have arranged the CD process across environments in *MULTISTAGE* format, passing *CONDITIONS* based on *USER INPUT* and also configuring *Approval Gates* in QA, STG and PROD.

--- 

## **Secret Management**
- Here sensitive data like *PAT* for agents, *SPN Password*, *ACR PAssword* all are kept in azure keyvault which are fetched during runtime to be used. 
- Also in the agent containers mainfest they are variablized so that no secret is exposed.
- Non-Sensitive data is either kept in *Variable Groups* in Azure Devops. 

---

## **Docker**
- I have used the microsoft provided ubuntu based agent dockerfile.
- I have made few changes like configuring installation of  python, helm and kubectl in the dockerfile to enable the agent to perform operations based on this tools.
- The dockerfile is build using docker commands and is then pushed to the ACR to be used as image in building of agent pods.

---

## **Kubernetes**
- **AKS** is used to deploy the azure agents as pods. A Deployment set has been created with a replica of 2.
- **KEDA** is implemented for enabling autoscaling of pods based on the requests inflow for the respective Agent Pool in the specified organization.
- All the kubernetes resource are deployed as **HELM packages**.
- A Service Account with its respective clusterrole, and clusterrolebinding is created for the agents to have enough permissions to operate based on the requests it receives.


