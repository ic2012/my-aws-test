provider "aws" {
  region = "us-west-2"
}

variable "unique_string" {
  type = string
}

resource "random_string" "random_string" {
  length = 8
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-bucket-name-${var.unique_string}"
  acl    = "public-read"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
