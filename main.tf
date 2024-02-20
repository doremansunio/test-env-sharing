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

resource "rafay_cluster_sharing" "demo-terraform-specific" {  
  clustername = "eks-cluster"
  project     = "central-pool"
  sharing {
    all = false
    projects {
      name = team1
    }    
  }
}
