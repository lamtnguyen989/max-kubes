# Longhorn namespace remove finalizers
NAMESPACE=longhorn-system
kubectl get namespace $NAMESPACE -o json > $NAMESPACE.json
sed -i -e 's/"kubernetes"//' $NAMESPACE.json
kubectl replace --raw "/api/v1/namespaces/$NAMESPACE/finalize" -f ./$NAMESPACE.json
rm longhorn-system.json

# Delete CRDs round 1
kubectl get crd | grep 'longhorn.io' | awk '{print $1}' | xargs kubectl delete crd
# Delete CRDs round 2 for stuck resources due to finalizers
kubectl get crd -o name | grep 'longhorn.io' | while read crd; do
    kubectl patch "$crd" -p '{"metadata":{"finalizers":[]}}' --type=merge
done

kubectl delete ClusterRoleBinding longhorn-bind && kubectl delete ClusterRoleBinding longhorn-support-bundle
kubectl delete ClusterRole longhorn-role
kubectl delete namespace $NAMESPACE