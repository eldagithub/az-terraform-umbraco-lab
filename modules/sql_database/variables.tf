variable "db_name" {
  description = "The name of the SQL database."
  type        = string
}

variable "location" {
  description = "The Azure location where to deploy the SQL Database."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login for the SQL Server."
  type        = string
}

variable "administrator_login_password" {
  description = "The administrator password for the SQL Server."
  type        = string
  sensitive   = true
}

variable "db_subnet_id" {
  description = "The id of the subnet used for DB integration."
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