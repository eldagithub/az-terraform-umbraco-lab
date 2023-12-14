module "network-security" {
  source             = "../../modules/network-security"
  location           = var.resource_group_location
  resource_group_name = var.resource_group_name

  description = "network-security"
  environment = var.environment
  owner       = var.owner  

}


module "sql_database" {
  source             = "../../modules/sql_database"
  db_name            = var.db_name
  location           = var.resource_group_location
  resource_group_name = module.network-security.rg_name
  administrator_login = var.db_user_name
  administrator_login_password = var.db_user_password

  db_subnet_id = module.network-security.db_subnet_id

  description = "sql_database"
  environment = var.environment
  owner       = var.owner  

  depends_on = [module.network-security]
}




module "blob_storage" {
  source             = "../../modules/blob_storage"
  storage_name       = var.storage_account_name
  location           = var.resource_group_location
  resource_group_name = module.network-security.rg_name

  description = "blob_storage"
  environment = var.environment
  owner       = var.owner  
}


module "traffic_manager" {
  source             = "../../modules/traffic_manager"
  tm_name            = var.traffic_manager_name
  resource_group_name = module.network-security.rg_name

  description = "traffic_manager"
  environment = var.environment
  owner       = var.owner  
}


module "app_service_1" {
  source             = "../../modules/app_service"
  app_name           = "${var.app_service_basename}1"
  location           = var.resource_group_location
  resource_group_name = module.network-security.rg_name
  
  service_plan_sku_name = var.service_plan_sku_name
  allowed_endusers_cidr = var.allowed_endusers_cidr
  
  tm_profile_id = module.traffic_manager.tm_id
  priority = 1

  description = "app_service"
  environment = var.environment
  owner       = var.owner  

  depends_on = [module.traffic_manager]
}

module "app_service_2" {
  source             = "../../modules/app_service"
  app_name           = "${var.app_service_basename}2"
  location           = var.resource_group_location
  resource_group_name = module.network-security.rg_name
  
  service_plan_sku_name = var.service_plan_sku_name
  allowed_endusers_cidr = var.allowed_endusers_cidr

  tm_profile_id = module.traffic_manager.tm_id
  priority = 2
 
  description = "app_service"
  environment = var.environment
  owner       = var.owner  

  depends_on = [module.traffic_manager]
}
