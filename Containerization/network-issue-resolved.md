
# **Kubernetes Networking Issue**
---

### **Scenario** ###

*Investigate and resolve an AKS issue where pods cannot communicate with external services*

### **Solution** ###

From **INSIDE AKS**
- Pods cannot by default communicate outside due to which Services are implemented.
- Pods not able to externally commnicate meaning they are not able to pass their information to the services (NODEPORT in this scenario). 
- Run *kubectl logs <podname> -n <ns>* to check the pods logs. Also try *kubectl events -n <ns>* .
- Run *kubectl describe service <service name>* and check their selector labels are correctly configured to map to that respective service or not.

From **Azure Networking side** , we can check the following:
- The NSGs for outbound rules and RouteTables to see where the traffic are being routed. If the Route tables first routes to Firewall, check if the correct Firewall IP is configured or not and then the Firewall Rules as well.
- If for example a pod is trying to communicate to a storage  in a different VNET , I need to check if the the AKS VNet is peered to that storage VNet to enable cross vnet communaication or use private endpoint. Also need to chcek the application is referring to correct connection string of the storage or not.

---