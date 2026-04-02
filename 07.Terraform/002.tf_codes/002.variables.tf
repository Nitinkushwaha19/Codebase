variable "create_resource_group" {
  type        = bool
  description = "create rg or not"
}

variable "resource_group_name" {
  type        = string
  description = "name of resource group"
}

variable "resouce_group_location" {
  type        = string
  description = "location of resource group"
}


variable "create_virtual_network" {
  type        = bool
  description = "create vnet or not"
}


variable "virtual_network_name" {
  type        = string
  description = "name of virtual network"
}

variable "virtual_network_address_space" {
  type        = list(string)
  description = "address space for virtual network"
}

variable "create_subnet_name" {
  type        = string
  description = "name of subnet"
}

variable "virtual_subnet_address_space" {
  type        = list(string)
  description = "address space for subnet"
}

variable "resource_public_ip_name" {
  type        = string
  description = "name of public ip"
}

# log analytics workspace
variable "resource_log_analytics_workspace_name" {
  type        = string
  description = "name of log analytics workspace"
}

variable "environment" {
  type        = string
  description = "environment name"
}

variable "project" {
  type        = string
  description = "project name"
}
