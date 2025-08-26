# Script for launching longhorn (storage) WebUI via  port-forwarding (will delete in the future tho)
xdg-open http://localhost:8081/#/dashboard
kubectl port-forward svc/longhorn-frontend -n longhorn-system 8081:80