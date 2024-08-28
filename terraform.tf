terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terraform-aws-account-state-bct"
    dynamodb_table = "tf-aws-account-creation-stlock"
    key            = "aws-account-budget-module/terraform.tfstate"
    region         = "us-east-1"
  }
}