terraform {
  required_providers {
    snowflake = {
      source  = "Snowflakedb/snowflake"
      version = ">= 1.0.0"
    }
  }

  backend "s3" {
    bucket = "prasad-snowflake-demo"
    key    = "terraform-prod.tfstate"
    region = "us-east-1"
    # Optional DynamoDB for state locking. See https://developer.hashicorp.com/terraform/language/settings/backends/s3 for details.
    # dynamodb_table = "terraform-state-lock-table"
    encrypt = true
    assume_role = {
      role_arn     = "arn:aws:iam::222259241209:role/prasad-snowflake-demo-s3"
      session_name = "terraform-session" # Optional
    }
  }
}

provider "snowflake" {
  account_name      = var.snowflake_account_name
  organization_name = var.snowflake_organization_name

  preview_features_enabled = [
    "snowflake_table_resource"
  ]

}


module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 30
  database            = var.database
  env_name            = var.env_name
}