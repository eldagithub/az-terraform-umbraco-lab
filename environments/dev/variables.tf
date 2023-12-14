#STANDARD AZURE CONNECTION PARAMS
variable "subscription_id" {   type        = string }
variable "client_id" {   type        = string }
variable "client_secret" {   type        = string }
variable "tenant_id" {   type        = string }



#PROJECT VARAIBLES
variable "resource_group_name" {
  type        = string
  description = "Name of the azure resource group."
}

variable "resource_group_location" {
  type        = string
  description = "Location of the azure resource group."
}

variable "db_name" {
  type        = string
  description = "DB name for database connexion"
}

variable "db_user_name" {
  type        = string
  description = "User name for database connexion"
}

variable "db_user_password" {
  type        = string
  description = "User password for database connexion"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "traffic_manager_name" {
  type        = string
  description = "Name of the traffic manager"
}


variable "app_service_basename" {
  type        = string
  description = "Base Name of the app service"
}

variable "service_plan_sku_name" {
  description = "The sku name of the service plan."
  type        = string
}

variable "allowed_endusers_cidr" {
  description = "Cidr IP range for allowed endusers IPs."
  type        = string
}

#TAG VAIRABLES
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

