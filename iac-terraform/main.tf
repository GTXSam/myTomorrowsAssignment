module "mytomapp_test" {
  source = "./modules/mytom-helmdeploy"

  mytom_env = "test"
  //replicas   = 5 #Override values.yaml set replica

  release_name  = "mytomorrows"
  chart_name    = "../helm/mytomapp"
  chart_version = "1.0.0"
  namespace     = "mytomorrowstest"
  values_path   = ["${file("../helm/mytomapp/values-test.yaml")}"]
  repository    = "test"

  #Horizontal AutoScaling
  hpa_enabled = false #If False, hpa_minmax are ignored
  hpa_minReplicas = 1
  hpa_maxReplicas = 3

  #Pod Disruption Budgets
  pdb_enabled    = false #If False, minAvailPDB ignored
  pdb_minAvailablePDB = 3

  atomic          = true
  cleanup_on_fail = true

  #Force update over existing Chart
  force_update = true

  #Force release with same name
  replace_release = true

}

module "mytomapp_prod" {
  source = "./modules/mytom-helmdeploy"

  mytom_env = "prod"

  #Override values.yaml set replica
  replicas = 5

  release_name  = "mytomorrows"
  chart_name    = "../helm/mytomapp"
  chart_version = "1.0.1"
  namespace     = "mytomorrows"
  values_path   = ["${file("../helm/mytomapp/values-prod.yaml")}"]
  repository    = "test"

  #Horizontal AutoScaling
  hpa_enabled = false #If False, hpa_minmax are ignored
  hpa_minReplicas = 1
  hpa_maxReplicas = 3

  #Pod Disruption Budgets
  pdb_enabled    = false #If False, minAvailPDB ignored
  pdb_minAvailablePDB = 3

  atomic          = true
  cleanup_on_fail = true

  #Force update over existing Chart
  force_update = true

  #Force release with same name
  replace_release = true

}