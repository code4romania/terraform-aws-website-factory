resource "aws_lightsail_container_service" "container_service" {
  name  = local.container.service_name
  power = local.container.power
  scale = local.container.scale

  dynamic "public_domain_names" {
    for_each = var.hostname == null ? [] : [var.hostname]

    content {
      certificate {
        certificate_name = replace(public_domain_names.value, ".", "-")

        domain_names = [
          public_domain_names.value,
          "www.${public_domain_names.value}"
        ]
      }
    }
  }
}

resource "aws_lightsail_container_service_deployment_version" "container_deployment" {
  service_name = aws_lightsail_container_service.container_service.name

  container {
    container_name = local.container.deployment_name
    image          = "${local.container.docker_image}:${var.docker_tag}"

    environment = {
      "APP_URL"                 = local.app_url
      "APP_DEBUG"               = var.debug_mode
      "APP_ENV"                 = var.env
      "APP_KEY"                 = random_password.app_key.result
      "WEBSITE_FACTORY_EDITION" = var.edition
      "DB_CONNECTION"           = "pgsql"
      "DB_HOST"                 = aws_lightsail_database.database.master_endpoint_address
      "DB_PORT"                 = aws_lightsail_database.database.master_endpoint_port
      "DB_DATABASE"             = aws_lightsail_database.database.master_database_name
      "DB_USERNAME"             = aws_lightsail_database.database.master_username
      "DB_PASSWORD"             = aws_lightsail_database.database.master_password
      "MAIL_MAILER"             = "ses"
      "MAIL_FROM_ADDRESS"       = local.mail.from_address
      "FILESYSTEM_DRIVER"       = "s3"
      "FILESYSTEM_CLOUD"        = "s3"
      "ADMIN_EMAIL"             = var.admin_email
      "ADMIN_PASSWORD"          = random_password.admin_password.result
      "AWS_BUCKET"              = aws_s3_bucket.media.bucket
      "AWS_DEFAULT_REGION"      = var.region
      "AWS_ACCESS_KEY_ID"       = aws_iam_access_key.iam_user_key.id
      "AWS_SECRET_ACCESS_KEY"   = aws_iam_access_key.iam_user_key.secret
      "AWS_URL"                 = "https://${aws_cloudfront_distribution.media_distribution.domain_name}"
      "SENTRY_DSN"              = var.sentry_dsn
      "SENTRY_ENVIRONMENT"      = coalesce(var.sentry_environment, var.project_slug)
    }

    ports = {
      80 = "HTTP"
    }
  }

  public_endpoint {
    container_name = local.container.deployment_name
    container_port = 80

    health_check {
      interval_seconds = 30
      path             = "/health"
    }
  }

  depends_on = [
    aws_lightsail_database.database
  ]
}
