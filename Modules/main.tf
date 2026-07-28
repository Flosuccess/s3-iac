resource "aws_s3_bucket" "uptropical757" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "uptropical757" {
  bucket = aws_s3_bucket.uptropical757.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "AllowTestUserAccess"
        Effect = "Allow"

        Principal = {
          AWS = "arn:aws:iam::628234978954:user/test"
        }

        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]

        Resource = "${aws_s3_bucket.uptropical757.arn}/*"
      }
    ]
  })
}
