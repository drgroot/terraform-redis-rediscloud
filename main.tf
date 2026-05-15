variable "name" {
  type = string
}

variable "plan" {
  type = string
  default = "250MB"
}

data "rediscloud_payment_method" "card" {
  card_type = "Visa"
}

data "rediscloud_essentials_plan" "plan" {
  name = var.plan
  cloud_provider = "AWS"
  region = "us-east-1"
  availability = "No replication"
}

resource "rediscloud_essentials_subscription" "subscription" {
  name              = var.name
  plan_id = data.rediscloud_essentials_plan.plan.id
  payment_method_id = data.rediscloud_payment_method.card.id
}

resource "rediscloud_essentials_database" "database" {
  subscription_id     = rediscloud_essentials_subscription.subscription.id
  name                = var.name
  enable_default_user = true

  data_persistence = "none"
  replication      = false
  data_eviction    = "allkeys-lru"
}