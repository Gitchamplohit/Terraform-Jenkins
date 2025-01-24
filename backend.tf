terraform {
  backend "s3" {
    bucket         = "my-terra-bucket20250124055304007700000001" #bucket needs to be created first using main.tf for s3 bucket using bucket_prefix
    key            = "Terra.tfstate"
    region         = "us-east-1"
    dynamodb_table = "My-db-table"

  }
}
