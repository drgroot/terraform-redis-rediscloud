output "credentials" {
  value = {
    hostname = split(":", rediscloud_essentials_database.database.public_endpoint)[0]
    url = "redis://default:${rediscloud_essentials_database.database.password}@${rediscloud_essentials_database.database.public_endpoint}"
  }

  sensitive = true
}
