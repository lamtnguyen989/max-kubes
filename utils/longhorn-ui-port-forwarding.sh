# Script for launching longhorn (storage) WebUI via  port-forwarding (will delete in the future tho)
xdg-open https://localhost:8081
kubectl port-forward service/argocd-server -n argocd 8081:80