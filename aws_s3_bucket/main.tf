terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_s3_bucket" "srecoursebuf-s3" {
  bucket = "tarrotomado"
  /*
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  */
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
/*
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.srecoursebuf-s3.id
  acl    = "private"
}

resource "aws_s3_bucket_object" "s3_object_estadistica" {
  bucket = "tarrotomado"
  key    = "new_object_key"
  source = "aws_s3_bucket/archivos"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  #etag = "${md5(file("s3://tarrotomado"))}"
}

resource "aws_s3_bucket_object" "s3_object_test" {
  Primero se recorre la carpeta documents con un for_each para identificar todos los ducmentos
  que se pasaran al s3, funcion fileset requiere dos parametros (la ruta , el patron en este caso "**")
   https://developer.hashicorp.com/terraform/language/functions/fileset 
  for_each = fileset("./documents/","**")

  # el nombre del s3
  bucket = "tarrotomado"
  
  # el nombre del objeto en este ejemplo es el mismo que en la ruta
  key = each.value

  #La ruta al archivo que se va  acargar
  source = "./documents/${each.value}"
  
  #Se activa una actualizacion solo si el archivo se cambia, el etag de cada objeto es un hash MD5 de ese objeto
  etag = filemd5("./documents/${each.value}")
}
*/

