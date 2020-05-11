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

### Kube PS-1 https://github.com/jonmosco/kube-ps1#installing
KUBE_PS1_BINARY='aws-okta exec developer -- kubectl'
KUBE_PS1_NS_ENABLE=false
KUBE_PS1_SYMBOL_ENABLE=true
KUBE_PS1_PREFIX=
KUBE_PS1_SUFFIX=
KUBE_PS1_SEPARATOR=
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='[$(kube_ps1) \W$(__git_ps1 " (%s)")] $ '