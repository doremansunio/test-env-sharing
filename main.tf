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

# # Create new Rafay workspace group
# resource "rafay_group" "group-Workspace" {  
#   name        = "WrkspAdmin-grp-${var.project_name}"
#   description = "Workspace Admin Group for ${var.project_name}"  
# }

# # Creare new group assocication
# resource "rafay_groupassociation" "group-association" {
#   depends_on = [rafay_group.group-Workspace]
#   group      = "WrkspAdmin-grp-${var.project_name}"
#   project    = var.project_name
#   roles = ["WORKSPACE_ADMIN","ENVIRONMENT_TEMPLATE_USER"]
#   # add_users = ["${var.workspace_admins}"]
#   add_users = var.workspace_admins
# }

resource "rafay_cluster_sharing" "demo-terraform-specific" {  
  clustername = "eks-cluster"
  project     = "centralpool"

  for_each = toset(var.workspace_admins)
    sharing {
        all = false
    
        projects {
        name = each.value
        }
    }
}
