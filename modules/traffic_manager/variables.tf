variable "tm_name" {
  description = "The name of the Traffic Manager profile."
  type        = string
}


variable "resource_group_name" {
  description = "The name of the resource group."
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