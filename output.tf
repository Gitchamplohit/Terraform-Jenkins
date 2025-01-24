output "Bucket-name" {
  value = aws_s3_bucket.Terra-Bucket.id

}

output "vpc-name" {
  value = aws_vpc.Terra-vpc

}
