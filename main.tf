//You can use your Terraform code below to read the db-creds secret you created from the console, using data source. 

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "db-creds"
  
}

//Since the secret is stored as JSON, we need to use jsonencode function to parse the JSON into the 
//local variable db_creds:

locals {
  db_creds = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}



resource "aws_db_instance" "mydb" {
  identifier = "terrform-aws-db-instance"
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.db_engine
  engine_version       = "5.7"
  instance_class       = var.instance_class
  # username             = var.db_username
  # password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  username = local.db_creds.username
  password = local.db_creds.password
}
