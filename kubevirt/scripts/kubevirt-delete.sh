# Delete kubevirt

#export VERSION=$(curl -s https://api.github.com/repos/kubevirt/kubevirt/releases | grep tag_name | grep -v -- '-rc' | sort -r | head -1 | awk -F': ' '{print $2}' | sed 's/,//' | xargs)
export VERSION=v1.5.2

kubectl delete -f https://github.com/kubevirt/kubevirt/releases/download/$VERSION/kubevirt-operator.yaml
kubectl delete -f https://github.com/kubevirt/kubevirt/releases/download/$VERSION/kubevirt-cr.yaml

# Deleting the Kubevirt-related CRDs
MATCH_STRING="kubevirt"
kubectl get crds -oname | grep "$MATCH_STRING" | xargs kubectl delete

###     A few considerations to make if the uninstallation hangs    ###
# kubectl patch crd/kubevirts.kubevirt.io -p '{"metadata":{"finalizers":[]}}' --type=merge
# kubectl delete crd kubevirts.kubevirt.io
# kubectl get namespace kubevirt -o json > kubevirt.json 
# vim the kubevirt.json and empty the finalizer (specifically CHANGE finalizer: ["kubernetes"] ----> finalizer: [])
# kubectl replace --raw "/api/v1/namespaces/kubevirt/finalize" -f ./kubevirt.json
# kubectl delete ns kubevirt