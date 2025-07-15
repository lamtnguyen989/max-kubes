# Script for launching longhorn (storage) WebUI via  port-forwarding (will delete in the future tho)
xdg-open https://localhost:8081
kubectl port-forward svc/longhorn-frontend -n longhorn-system 8081:80