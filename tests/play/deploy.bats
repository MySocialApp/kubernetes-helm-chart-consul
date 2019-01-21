#!/usr/bin/env bats

load ../k8s-euft/env
load common

@test "Deploying Consul helm chart" {
    helm install kubernetes -n consul
}

@test "Check Consul is deployed" {
    check_pod_is_running statefulset '-l app=consul'
}

@test "Re-run deploy on the current version" {
    # Test upgrade of the current helm with same content to ensure there is no mistakes
    helm upgrade consul kubernetes
}
