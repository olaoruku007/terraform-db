variable "db_name" {
  default = "mydb"
}

variable "region" {
  default = "us-east-1"
}

variable "db_engine" {
  default = "mysql"
}

variable "instance_class" {
  default = "db.t2.micro"
}

variable "allocated_storage" {
  default = 10
}

# variable "db_username" { //"$export TF_VAR_db_username=admin"
#     description = "The database username"
#     type = string
#     sensitive = true
  
# }

# variable "db_password" { //"$export TF_VAR_db_password=admin2023"
#     description = "The database password"
#     type = string
#     sensitive = true
  
# }