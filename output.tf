output "app_url" {
  value = local.app_url
}

output "admin_password" {
  value     = random_password.admin_password.result
  sensitive = true
}
