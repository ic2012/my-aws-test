provider "aws" {
  region = "us-west-2"
}

resource "random_string" "random_string" {
  length = 8
}

variable "unique_string" {
  default = "${random_string.random_string.result}"
  type = string
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
