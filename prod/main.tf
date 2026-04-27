terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version >= "1.0.0"
    }
  }

  backend "s3" {
    bucket         = "arn:aws:s3:::prasad-snowflake-demo"
    key            = "terraform-prod.tfstate"
    region         = "US East (N. Virginia) us-east-1"
    # Optional DynamoDB for state locking. See https://developer.hashicorp.com/terraform/language/settings/backends/s3 for details.
    # dynamodb_table = "terraform-state-lock-table"
    encrypt        = true
    role_arn       = "arn:aws:iam::<your-aws-account-no>:role/<terraform-s3-backend-access-role>"
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