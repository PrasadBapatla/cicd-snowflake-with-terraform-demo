resource "snowflake_grant_privileges_to_account_role" "database_ro" {
  account_role_name = "TF_DEMO_READER"
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.tf_demo_database.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "schema_usage" {
  account_role_name = "TF_DEMO_READER"
  privileges        = ["USAGE"]

  on_schema {
    schema_name = snowflake_schema.tf_demo_schema.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "warehouse_usage" {
  account_role_name = "TF_DEMO_READER"
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.task_warehouse.name
  }
}
