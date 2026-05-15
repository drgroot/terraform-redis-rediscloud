terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
  }

  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "5.3.0"
    }

    rediscloud = {
      source = "RedisLabs/rediscloud"
      version = "2.4.1"
    }
  }
}

provider "vault" {  
  
}