module "aws_s3_bucket" {
  source       = "../Modules"
  bucket_name  = var.bucket_name
  force_destroy = false
  tags = {
    Owner = "BL-K8S"
  }
}
