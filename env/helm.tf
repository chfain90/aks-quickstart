resource "helm_release" "prometheus" {
    name      = "prometheus"
    chart     = "stable/prometheus"
}

resource "helm_release" "grafana" {
    name      = "grafana"
    chart     = "stable/grafana"
}

resource "helm_release" "nginx" {
    name      = "nginx"
    chart     = "stable/nginx-ingress"

    values = [<<VALUES
        controller:
          service:
            type: LoadBalancer
            loadBalancerIP: 10.240.0.25
            annotations: 
              service.beta.kubernetes.io/azure-load-balancer-internal: "true"
    VALUES
    ]
}
