module "mytomapp_test" {
    source = "./modules/mytom-helmdeploy"

    mytom_env  = "test"
    //replicas   = 5 #Override values.yaml set replica

    release_name = "mytomorrows"
    chart_name   = "../helm/mytomapp"
    chart_version   = "1.0.0"
    namespace    = "mytomorrowstest"
    values_path  = ["${file("../helm/mytomapp/values-test.yaml")}"]
    repository   = "test"

    atomic = true
    cleanup_on_fail = true

    #Force update over existing Chart
    force_update = true

    #Force release with same name
    replace_release  = true

}

 module "mytomapp_prod" {
     source = "./modules/mytom-helmdeploy"

     mytom_env  = "prod"
     replicas   = 10 #Override values.yaml set replica

     release_name = "mytomorrows"
     chart_name   = "../helm/mytomapp"
     chart_version   = "1.0.1"
     namespace    = "mytomorrows"
     values_path  = ["${file("../helm/mytomapp/values-prod.yaml")}"]
     repository   = "test"

     atomic = true
     cleanup_on_fail = true

     #Force update over existing Chart
     force_update = true

     #Force release with same name
     replace_release  = true

 }