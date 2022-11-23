terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_s3_bucket" "srecoursebuf-s3" {
  bucket = "tarrotomado"
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_object" "s3_object_estadistica" {
  bucket = "tarrotomado"
  key    = "new_object_key"
  source = "https://www.gob.cl/"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  #etag = "${md5(file("s3://tarrotomado"))}"
}