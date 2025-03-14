variable "docker_tag" {
  description = "Docker image tag"
  type        = string
  default     = "1.10.4"
}

variable "project_slug" {
  description = "Project slug"
  type        = string
}

variable "edition" {
  description = "Website Factory edition to deploy"
  type        = string
  default     = "ong"
}

variable "hostname" {
  description = "Domain for website factory web app"
  type        = string
  default     = null
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "production"
}

variable "debug_mode" {
  description = "Enable debug mode"
  type        = bool
  default     = false
}

variable "region" {
  description = "Region where to deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "availability_zone" {
  description = "Availability zone (suffix only)"
  type        = string
  default     = "b"

  validation {
    condition     = contains(["a", "b", "c"], var.availability_zone)
    error_message = "Allowed values for availability_zone are \"a\", \"b\", or \"c\"."
  }
}

variable "ses_domain" {
  description = "Domain for AWS SES"
  type        = string
  default     = null
}

variable "ses_configuration_set_arn" {
  description = "Configuration set arn attached to `ses_domain`"
  type        = string
  default     = null
}

variable "admin_email" {
  description = "Email address of initial admin account"
  type        = string
  default     = null
}

variable "sentry_dsn" {
  description = "Sentry DSN"
  type        = string
  default     = null
}

variable "sentry_environment" {
  description = "Sentry environment"
  type        = string
  default     = null
}
