kubectl get crd | grep 'longhorn.io' | awk '{print $1}' | xargs kubectl delete crd
kubectl delete ClusterRoleBinding longhorn-bind && kubectl delete ClusterRoleBinding longhorn-support-bundle
kubectl delete ClusterRole longhorn-role
kubectl delete namespace longhorn-system