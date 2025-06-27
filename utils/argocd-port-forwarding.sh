# Script for launching argocd WebUI via  port-forwarding (will delete in the future tho)
xdg-open https://localhost:8080
kubectl port-forward service/argocd-server -n argocd 8080:443