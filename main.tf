# Variables
variable "s3_bucket_name" {
  type = string
}

# Resources
resource "aws_s3_bucket" "example" {
  bucket = var.s3_bucket_name
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Output
output "s3_bucket_name" {
  value = aws_s3_bucket.example.bucket
}
