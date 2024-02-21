terraform {
  required_providers {
    rafay = {
      source = "RafaySystems/rafay"
      version = "1.1.22"
    }
  }
}

provider "rafay" {
  # provider_config_file = "./rafay_config.json"
}

# resource "rafay_cluster_sharing" "demo-terraform-specific" {  
#   clustername = "eks-cluster"
#   project     = "central-pool"
#   sharing {
#     all = false
#     projects {
#       name = "defaultproject"
#     }    
#   }
# }


resource "rafay_environment_template" "aws-et-example" {  
  metadata {
    name    = "naas-envir-template"
    project = "centralpool"
  }
  spec {
    version = "v1"
    sharing {
      enabled = true

      projects {
        name = "defaultproject"
      }
    }
  }
}
