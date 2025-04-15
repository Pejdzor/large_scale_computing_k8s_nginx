helm repo add stable https://charts.helm.sh/stable
helm install nfs-server stable/nfs-server-provisioner \
  --set storageClass.name=nfs \
  --set persistence.enabled=false \
  --set persistence.size=10Gi


kubectl apply -f pvc.yaml
kubectl apply -f deplo.yaml
kubectl apply -f srv.yaml
kubectl apply -f job.yaml


# Now we check Service URL via kubectl describe and go through browser