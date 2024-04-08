# Check pod logs using deployment:
kubectl -n sre logs deployments/upcommerce-app-two 

# Check warning events related to Deployment Pods:
export POD_NAME=$(kubectl get pods --namespace sre -l "app=upcommerce-app-two" -o jsonpath="{.items[0].metadata.name}")
kubectl -n sre events  --types=Warning --for=Pod/${POD_NAME}


```
14m (x9 over 49m)   Warning   FailedScheduling   Pod/upcommerce-app-two-56cff9c64d-jfc6m   0/1 nodes are available: 1 Insufficient cpu. preemption: 0/1 nodes are available: 1 No preemption victims found for incoming pod..
```

# Resolution: 
## Find how many cpus are available on the node
``` 
kubectl get nodes minikube  -o custom-columns="CPU:.status.allocatable.cpu"
```
Adjust the deployment from 10 to 1 accordingly.

```
kubectl  apply -f deployment.yml -n sre
```
