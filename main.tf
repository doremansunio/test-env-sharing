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

resource "rafay_environment_template" "aws-et-example" {  
  metadata {
    name    = "test-env-new"
    project = "centralpool"
  }
  spec {
    version = "v1"

    resources {
       type = "dynamic"
       kind = "resourcetemplate"
       name = "test"
       resource_options {
         version = "v1"
       }
    }
    sharing {
      enabled = true

      projects {
        name = "defaultproject"
      }
    }
