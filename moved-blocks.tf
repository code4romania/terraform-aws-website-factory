moved {
  from = module.web_app.data.aws_iam_policy_document.bucket_acccess
  to = data.aws_iam_policy_document.bucket_acccess
}
moved {
  from = module.web_app.data.aws_iam_policy_document.bucket_policy
  to = data.aws_iam_policy_document.bucket_policy
}
moved {
  from = module.web_app.data.aws_iam_policy_document.ses_email_send
  to = data.aws_iam_policy_document.ses_email_send
}
moved {
  from = module.web_app.data.aws_ses_domain_identity.main["0"]
  to = data.aws_ses_domain_identity.main["0"]
}
moved {
  from = module.web_app.aws_cloudfront_cache_policy.media_distribution_cache_policy
  to = aws_cloudfront_cache_policy.media_distribution_cache_policy
}
moved {
  from = module.web_app.aws_cloudfront_distribution.media_distribution
  to = aws_cloudfront_distribution.media_distribution
}
moved {
  from = module.web_app.aws_cloudfront_origin_access_identity.media_distribution
  to = aws_cloudfront_origin_access_identity.media_distribution
}
moved {
  from = module.web_app.aws_cloudfront_origin_request_policy.media_distribution_origin_request_policy
  to = aws_cloudfront_origin_request_policy.media_distribution_origin_request_policy
}
moved {
  from = module.web_app.aws_iam_access_key.iam_user_key
  to = aws_iam_access_key.iam_user_key
}
moved {
  from = module.web_app.aws_iam_user.iam_user
  to = aws_iam_user.iam_user
}
moved {
  from = module.web_app.aws_iam_user_policy.email_send_policy
  to = aws_iam_user_policy.email_send_policy
}
moved {
  from = module.web_app.aws_iam_user_policy.media_access_policy
  to = aws_iam_user_policy.media_access_policy
}
moved {
  from = module.web_app.aws_lightsail_container_service.container_service
  to = aws_lightsail_container_service.container_service
}
moved {
  from = module.web_app.aws_lightsail_container_service_deployment_version.container_deployment
  to = aws_lightsail_container_service_deployment_version.container_deployment
}
moved {
  from = module.web_app.aws_lightsail_database.database
  to = aws_lightsail_database.database
}
moved {
  from = module.web_app.aws_s3_bucket.media
  to = aws_s3_bucket.media
}
moved {
  from = module.web_app.aws_s3_bucket_ownership_controls.media
  to = aws_s3_bucket_ownership_controls.media
}
moved {
  from = module.web_app.aws_s3_bucket_policy.media_policy
  to = aws_s3_bucket_policy.media_policy
}
moved {
  from = module.web_app.aws_s3_bucket_public_access_block.media_public_access_block
  to = aws_s3_bucket_public_access_block.media_public_access_block
}
moved {
  from = module.web_app.aws_s3_bucket_server_side_encryption_configuration.encrypt
  to = aws_s3_bucket_server_side_encryption_configuration.encrypt
}
moved {
  from = module.web_app.random_password.admin_password
  to = random_password.admin_password
}
moved {
  from = module.web_app.random_password.app_key
  to = random_password.app_key
}
moved {
  from = module.web_app.random_password.db_pass
  to = random_password.db_pass
}
moved {
  from = module.web_app.random_string.bucket_suffix
  to = random_string.bucket_suffix
}
