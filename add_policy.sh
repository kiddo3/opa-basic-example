kubectl create configmap opa-policy-deployment --from-file=policies/deployment.rego -o yaml --dry-run | kubectl apply -f -
kubectl label  configmap opa-policy-deployment openpolicyagent.org/policy=rego

kubectl create configmap opa-policy-main --from-file=policies/main.rego -o yaml --dry-run | kubectl apply -f -
kubectl label  configmap opa-policy-main openpolicyagent.org/policy=rego