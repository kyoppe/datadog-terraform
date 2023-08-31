terraform {
  required_version = "= 0.13.7"

  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = "3.29.0"
    }
  }
}

module "sandbox" {
  source  = "./sandbox"
  sandbox_api_key  = var.sandbox_api_key
  sandbox_app_key  = var.sandbox_app_key
}

module "demo" {
  source  = "./demo"
  demo_api_key = var.demo_api_key
  demo_app_key = var.demo_app_key
}
