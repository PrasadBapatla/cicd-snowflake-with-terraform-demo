terraform {
  required_providers {
    snowflake = {
      source  = "Snowflakedb/snowflake"
      version = ">= 1.0.0"
    }
  }

  backend "s3" {
    bucket         = "prasad-snowflake-demo"
    key            = "terraform-prod.tfstate"
    region         = "us-east-1"
    # Optional DynamoDB for state locking. See https://developer.hashicorp.com/terraform/language/settings/backends/s3 for details.
    # dynamodb_table = "terraform-state-lock-table"
    encrypt        = true
    assume_role= { 
       role_arn  = "arn:aws:iam::222259241209:role/prasad-snowflake-demo-s3"
       session_name = "terraform-session" # Optional
    }
  }
}

provider "snowflake" {
  username    = "PBAPATLAAP"
  account     = "ZDXBILS-FXC86730"
  role        = "ACCOUNTADMIN"
  private_key = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 30
  database            = var.database
  env_name            = var.env_name
}