provider "aws" {
  region = var.aws_region

}

resource "aws_s3_bucket" "Terra-Bucket" {
  bucket_prefix = var.bucket_prefix


}

resource "aws_s3_bucket_acl" "Terra-Bucket-acl" {
  acl    = var.acl
  bucket = aws_s3_bucket.Terra-Bucket.id


}

resource "aws_s3_bucket_versioning" "Version_enabled" {
  bucket = aws_s3_bucket.Terra-Bucket.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_vpc" "Terra-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    name = var.vpc_name
  }

}


