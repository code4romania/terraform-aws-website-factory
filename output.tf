output "admin_password" {
  value     = module.web_app.admin_password
  sensitive = true
}
