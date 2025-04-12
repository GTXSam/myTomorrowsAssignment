resource "helm_release" "my_chart" {
  name       = local.fullrelease_name
  chart      = var.chart_name
  version    = var.chart_version

  repository = local.chart_remote ? var.repository : null

  values = var.values_path
  namespace = var.namespace
  force_update   = var.force_update
  atomic      = var.atomic

  replace        = var.replace_release

  set {
    name  = "global.replicas"
    value = var.replicas
  }
}