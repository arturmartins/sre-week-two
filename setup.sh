# Create namespace
kubectl create namespace sre

# Install prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/prometheus \
  -f prometheus.yml \
  --namespace sre \

# Install grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana grafana/grafana \
 --namespace sre \
 --set adminPassword="admin"

# Wait for the deployments to complete (watch mode)
echo "Now run:"
echo "kubectl get deployments.apps -n sre -w"
