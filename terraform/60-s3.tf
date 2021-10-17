resource "aws_s3_bucket" "container_webapp_bucket" {
  bucket        = var.bucket_name
  acl           = "private"
  force_destroy = true
}

output "BUCKET_NAME" {
  value = aws_s3_bucket.container_webapp_bucket.id
}