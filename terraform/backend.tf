terraform {
  backend "s3" {
    bucket         = "gaurav-devops-tf-state-599913747923"
    key            = "github-actions-project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}