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

alias gw-kops="asdf global kubectl 1.7.16 && asdf current && kubectx us-east-1.gwdocker.com"
alias gw-staging-eks="asdf global kubectl 1.14.8 && asdf current && aws-okta exec developer -- aws eks --region us-east-1 update-kubeconfig --name gw-staging && kubectx arn:aws:eks:us-east-1:967710342214:cluster/gw-staging"
alias gw-production-eks="asdf global kubectl 1.14.8 && asdf current && aws-okta exec developer -- aws eks --region us-east-1 update-kubeconfig --name gw-production && kubectx arn:aws:eks:us-east-1:967710342214:cluster/gw-production"


