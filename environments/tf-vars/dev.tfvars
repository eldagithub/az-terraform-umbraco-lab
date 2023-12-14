#YOUR RESOURCE GROUP
resource_group_name = "UMBROCO-RG"

#YOUR AZURE REGION
resource_group_location = "East US"


#YOUR DB setting GROUP
db_name = "<--paste-your-db-name-here-->"
db_user_name = "<--paste-your-db-admin-user-here-->"
db_user_password = "<--paste-your-admin-password-here-->"


storage_account_name = "<--paste-your-key-here-->"

traffic_manager_name = "<--paste-your-key-here-->"

app_service_basename = "<--paste-your-key-here-->"
service_plan_sku_name = "P1v2" # change it if needed
allowed_endusers_cidr = "<--paste-your-cidr-here-->" #format : "x.x.x.x/x"

#Global Azure Tag
description = ""
environment = "DEV"  # change it if needed
owner       = "ELCA"   # change it if needed

