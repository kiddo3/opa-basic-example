package kubernetes.admission

import data.kubernetes.namespaces

operations = {"CREATE", "UPDATE"}

namespaces_apply = {"test"}

# Deployment labels
deny[msg] {
    is_deployment
    base_checking
    not input.request.object.metadata.labels["managed-by"]
    msg := "Deployment must define label managed-by"
}

deny[msg] {
    is_deployment
    base_checking
    not input.request.object.metadata.labels.app
    msg := "Deployment must define label app"
}

deny[msg] {
    is_deployment
    base_checking
    not input.request.object.metadata.labels.environment
    msg := "Deployment must define label environment"
}

base_checking {
    must_apply_namespace
    operations[input.request.operation]
}

is_deployment {
    input.request.kind.kind == "Deployment"
}

must_apply_namespace {
    namespaces_apply[input.request.namespace]!=null
}
