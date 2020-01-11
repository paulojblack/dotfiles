#!/bin/bash

### TODO
### add namespace autocomplete
### not relevant now but eventually probabl will deal with multiple pods

### Takes in namespace as argument, tails log (streaming)
kube_get_logs() {
    local NAMESPACE=$1

    kubectl -n ${NAMESPACE} logs -f $(kubectl get pod --namespace ${NAMESPACE} | tail -n 1 | cut -d' ' -f1)

}

### Takes in namespace as argument, opens port forward for node debugging
kube_node_proxy() {
    local NAMESPACE=$1

   kubectl port-forward $(kubectl get pod --namespace ${NAMESPACE} | tail -n 1 | cut -d' ' -f1) \
   --namespace ${NAMESPACE} 9229:9229
}

### Takes in namespace as argument, sshs to first pod
kube_ssh() {
    local NAMESPACE=$1

   kubectl -n ${NAMESPACE} exec -it $(kubectl get pod --namespace ${NAMESPACE} | tail -n 1 | cut -d' ' -f1) bash
}