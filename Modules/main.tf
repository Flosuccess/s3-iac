resource "aws_s3_bucket" "bl-sample" {
  bucket        = var.bucket_name
   force_destroy = false

  tags = {
    Owner = "BL-K8S"
   
  }
}

resource "aws_s3_bucket_policy" "bl-sample" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowReadAccess"
        Effect    = "Allow"
        Principal = ""
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.this.arn}/*"
      }
    ]
  })
}
