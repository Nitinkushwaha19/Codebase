create_resource_group  = true
resource_group_name    = "rg-terraform-001"
resouce_group_location = "eastus"

# Virtual Network
create_virtual_network = false
virtual_network_name   = "nitin-vnet"

virtual_network_address_space = ["10.0.0.0/16"]


# subnet
create_subnet_name           = "nitin-subnet"
virtual_subnet_address_space = ["10.0.0.0/24"]

# public ip
resource_public_ip_name = "nitin-public-ip"

# log analytics workspace
resource_log_analytics_workspace_name = "nitin-law"
environment                           = "dev"
project                               = "terraform"
