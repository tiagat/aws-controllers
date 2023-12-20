# aws-controllers


Install Argo CD

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

AWS Credentials

```yaml
# aws-credentials.yaml
apiVersion: v1
kind: Secret
metadata:
  name: aws-credentials
  namespace: ack-system
type: Opaque
stringData:
  credentials: |
    [default]
    aws_access_key_id = 
    aws_secret_access_key = 
```

```
kubectl apply -f aws-credentials.yaml
```
