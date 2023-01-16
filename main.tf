# Variables
variable "unique_string" {
  type = string
}

# Resources
resource "aws_s3_bucket" "my-bucket" {
  bucket = bucket = "my-bucket-${var.unique_string}"
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Output
output "unique_string" {
  value = aws_s3_bucket.my-bucket.bucket
}
