# OPA Example
Deploy OPA to kubernetes default namespace:
```bash
./install.sh
```

Configure policies:
```bash
./add_policy.sh
```

Test failing deployment:
```bash
kubectl create ns test
kubectl apply -f nginx-deployment.yaml
```