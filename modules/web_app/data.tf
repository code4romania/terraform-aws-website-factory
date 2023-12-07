data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]

    resources = [
      aws_s3_bucket.media.arn,
      "${aws_s3_bucket.media.arn}/*"
    ]

    principals {
      type = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.media_distribution.iam_arn
      ]
    }
  }
}

data "aws_iam_policy_document" "bucket_acccess" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:GetObjectAcl",
      "s3:PutObjectAcl",
      "s3:PutObject"
    ]

    resources = [
      aws_s3_bucket.media.arn,
      "${aws_s3_bucket.media.arn}/*"
    ]
  }
}

data "aws_iam_policy_document" "ses_email_send" {
  statement {
    actions = [
      "SES:SendEmail",
      "SES:SendRawEmail"
    ]

    resources = try(
      [data.aws_ses_domain_identity.main[0].arn],
      []
    )
  }
}

data "aws_ses_domain_identity" "main" {
  count  = local.ses_count
  domain = var.ses_domain
}
