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
