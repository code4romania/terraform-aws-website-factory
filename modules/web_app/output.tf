output "web_app_hostname" {
  value = local.app_url
}

output "admin_password" {
  value     = random_password.admin_password.result
  sensitive = true
}
