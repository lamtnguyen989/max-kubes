# Script for launching longhorn (storage) WebUI via  port-forwarding
kubectl port-forward svc/longhorn-frontend -n longhorn-system 8081:80
