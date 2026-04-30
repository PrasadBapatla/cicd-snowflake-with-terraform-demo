variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_STAGING"
}

variable "env_name" {
  type    = string
  default = "STAGING"
}

variable "snowflake_account_name" {
  type        = string
  description = "Snowflake account name"
  default = "FXC86730"
}

variable "snowflake_organization_name" {
  type        = string
  description = "Snowflake organization name"
  default = "ZDXBILS"
}