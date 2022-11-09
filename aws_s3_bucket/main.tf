resource "aws_s3_bucket" "srecoursebuf-s3"{
    bucket = "terraformgithubactions"
}

versioning{
    enable = "true"
}

server_side_encryption_configuration{
    rule{
        apply_server_side_encryption_by_default{
            sse_algorithm = "AES256"
        }
    }
}