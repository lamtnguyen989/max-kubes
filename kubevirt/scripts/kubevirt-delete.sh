# Delete the latest version (which is probably what's running with the install script)
export VERSION=$(curl -s https://api.github.com/repos/kubevirt/kubevirt/releases | grep tag_name | grep -v -- '-rc' | sort -r | head -1 | awk -F': ' '{print $2}' | sed 's/,//' | xargs)
kubectl delete -f https://github.com/kubevirt/kubevirt/releases/download/$VERSION/kubevirt-operator.yaml
kubectl delete -f https://github.com/kubevirt/kubevirt/releases/download/$VERSION/kubevirt-cr.yaml

# Deleting the Kubevirt-related CRDs
MATCH_STRING="kubevirt"
kubectl get crds -oname | grep "$MATCH_STRING" | xargs kubectl delete