variable "app_name" {
  description = "The name of the App Service."
  type        = string
}

variable "location" {
  description = "The Azure location where to deploy the App Service."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "service_plan_sku_name" {
  description = "The sku name of the service plan."
  type        = string
}

variable "tm_profile_id" {
  description = "The trafic manager id in which to add this webapp endpoint."
  type        = string
}

variable "priority" {
  description = "The priority for traffic manager Loadbalancing of this webapp endpoint."
  type        = number
}

variable "allowed_endusers_cidr" {
  description = "Cidr IP range for allowed endusers IPs."
  type        = string
}

# environment
variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
}

# owner
variable "owner" {
  type        = string
  description = "Specify the owner of the resource"
}

# description
variable "description" {
  type        = string
  description = "Provide a description of the resource"
}