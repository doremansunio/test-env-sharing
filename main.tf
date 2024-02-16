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

resource "rafay_project" "rafay_proj_new" {  
  metadata {
    name        = "t1"
    description = "terraform project"
  }
  spec {
    default = false    
  }
}

resource "rafay_environment_template" "aws-et-example" {
  metadata {
    name    = "waas-env-template"
    project = "centralpool"
  }
  spec {
    version = "v1"
    resources {
      type = "dynamic"
      kind = "resourcetemplate"
      name = "res-setup-rafay-project"
      resource_options {
        version   = "v1"
        //dedicated = true
      }      
    } 
    resources {
      type = "dynamic"
      kind = "resourcetemplate"
      name = "res-setup-rafay-prj-network-policies"
      resource_options {
        version   = "v1"
        //dedicated = true
      }
      depends_on {
        name = "res-setup-rafay-project"
      }
    }        
    sharing {
      projects {
        name = "team1"
      }
      projects {
        name = "team2"
      }
    }    
  }
}
