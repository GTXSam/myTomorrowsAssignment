resource "helm_release" "my_chart" {
  name       = local.fullrelease_name
  chart      = var.chart_name
  version    = var.chart_version

  repository = local.chart_remote ? var.repository : null

  values = var.values_path
  namespace = var.namespace
  force_update   = var.force_update
  atomic      = var.atomic
  cleanup_on_fail = var.cleanup_on_fail

  replace        = var.replace_release

  set {
    name  = "global.replicas"
    value = var.replicas
  }

  set {
    name  = "hpa.enabled"
    value = var.hpa_enabled
  }

  set {
    name  = "pdb.enabled"
    value = var.pdb_enabled
  }    

  dynamic "set" {
    for_each = var.hpa_enabled ? [
      {
        name  = "hpa.minReplicas"
        value = var.hpa_minReplicas
      },
      {
        name  = "hpa.maxReplicas"
        value = var.hpa_maxReplicas
      }
    ] : []
    content {
      name  = set.value["name"]
      value = set.value["value"]
    }
  }

  dynamic "set" {
    for_each = var.pdb_enabled ? [
      {
        name  = "pdb.minAvailablePDB"
        value = var.pdb_minAvailablePDB
      }
    ] : []
    content {
      name  = set.value["name"]
      value = set.value["value"]
    }
  }


}