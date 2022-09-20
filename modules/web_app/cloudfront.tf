resource "aws_cloudfront_distribution" "media_distribution" {
  comment         = "Media for ${local.namespace}"
  price_class     = "PriceClass_100"
  enabled         = true
  is_ipv6_enabled = true
  http_version    = "http2and3"

  origin {
    domain_name = aws_s3_bucket.media.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.media.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.media_distribution.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods          = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods           = ["GET", "HEAD", "OPTIONS"]
    viewer_protocol_policy   = "redirect-to-https"
    target_origin_id         = aws_s3_bucket.media.id
    cache_policy_id          = aws_cloudfront_cache_policy.media_distribution_cache_policy.id
    origin_request_policy_id = aws_cloudfront_origin_request_policy.media_distribution_origin_request_policy.id
    compress                 = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

resource "aws_cloudfront_origin_access_identity" "media_distribution" {
  comment = "Origin Acces Identity for ${aws_s3_bucket.media.bucket}"
}

resource "aws_cloudfront_cache_policy" "media_distribution_cache_policy" {
  name        = "${local.namespace}-cache"
  min_ttl     = 0
  default_ttl = 86400
  max_ttl     = 2628000

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }

    headers_config {
      header_behavior = "none"
    }

    query_strings_config {
      query_string_behavior = "none"
    }
  }
}

resource "aws_cloudfront_origin_request_policy" "media_distribution_origin_request_policy" {
  name = "${local.namespace}-request"

  cookies_config {
    cookie_behavior = "none"
  }

  headers_config {
    header_behavior = "none"
  }

  query_strings_config {
    query_string_behavior = "none"
  }
}
