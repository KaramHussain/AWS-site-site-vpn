terraform {
  backend "s3" {
    bucket         = "karamtask1statefile"
    key            = "terraform.tfstate2"
    region         = "us-east-1"
    dynamodb_table = "terraform_lock"
    encrypt        = true
  }
}