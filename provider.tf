provider "rediscloud" {
    secret_key = data.vault_generic_secret.rediscloud.data["key"]
    api_key    = data.vault_generic_secret.rediscloud.data["account-key"]
}

data "vault_generic_secret" "rediscloud" {
  path = "servc/iac/redis-cloud"
}
