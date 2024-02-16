terraform {
  required_providers {
    rafay = {
      source = "RafaySystems/rafay"
      version = "1.1.22"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }  
  }
}

provider "rafay" {
  # provider_config_file = "./rafay_config.json"
}

provider "github" {    
}

resource "rafay_environment_template" "aws-et-example" {
  metadata {
    name    = "waas-env-template"
    project = "central-pool"
  }
  spec {
    version = "v1"
    sharing {
      projects {
        name = "team1"
      }
      projects {
        name = "team2"
      }
    }    
}
