MATCH_STRING="cdi"
kubectl get crds -oname | grep "$MATCH_STRING" | xargs kubectl delete

kubectl get clusterroles -oname | grep "$MATCH_STRING" | xargs kubectl delete

kubectl get ClusterRoleBinding -oname | grep "$MATCH_STRING" | xargs kubectl delete

kubectl delete ns cdi