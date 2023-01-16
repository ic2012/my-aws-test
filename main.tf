resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket-name-${var.unique_string}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my-bucket" {
  bucket = aws_s3_bucket.my-bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "my-bucket" {
  bucket = aws_s3_bucket.my-bucket.id
  acl    = "private"
}

