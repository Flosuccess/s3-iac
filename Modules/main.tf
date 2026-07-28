resource "aws_s3_bucket" "uptropical7" {
  bucket        = var.bucket_name
}

resource "aws_s3_bucket_policy" "uptropical7" {
  bucket = aws_s3_bucket.uptropical7.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowReadAccess"
        Effect    = "Allow"
        Principal = ""
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.uptropical7.arn}/*"
      }
    ]
  })
}
