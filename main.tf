terraform {
  required_version = "= 0.13.7"

  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "3.29.0"
    }
  }
}

variable "api_key" {
  description = "API Key for Datadog" 
}

variable "app_key" {
  description = "Application Key for Datadog" 
}

provider "datadog" {
  api_key = var.api_key
  app_key = var.app_key
}
