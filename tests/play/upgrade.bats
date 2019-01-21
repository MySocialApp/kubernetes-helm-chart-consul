#!/usr/bin/env bats

load ../k8s-euft/env
load common

@test "Deploying Consul helm chart" {
    helm upgrade consul kubernetes
}

@test "Check Consul is deployed" {
    check_pod_is_running statefulset '-l app=consul'
}