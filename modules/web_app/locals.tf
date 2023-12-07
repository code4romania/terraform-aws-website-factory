locals {
  namespace_prefix = "wf-"
  namespace_suffix = var.env == "production" ? "" : "-${var.env}"
  namespace        = "${local.namespace_prefix}${var.project_slug}${local.namespace_suffix}"
  app_url          = replace(var.hostname != null ? "https://${var.hostname}" : aws_lightsail_container_service.container_service.url, "/\\/$/", "")

  container = {
    power           = "micro"
    scale           = 1
    service_name    = "${local.namespace}"
    deployment_name = "${local.namespace}-deployment"
    docker_image    = "code4romania/website-factory"
  }

  database = {
    name              = "${local.namespace}-db"
    blueprint_id      = "postgres_12"
    bundle_id         = "micro_2_0"
    username          = "psqladmin"
    password          = random_password.db_pass.result
    availability_zone = "${var.region}${var.availability_zone}"
  }

  ses_count = var.ses_domain != null ? 1 : 0

  mail = {
    from_address = var.ses_domain != null ? "no-reply@${var.ses_domain}" : null
  }
}
