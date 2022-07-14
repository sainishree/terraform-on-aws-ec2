# Terraform Block
terraform {
  required_version = "=> 1.0.1" # which means any version equal & above 1.0.1 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "ap-south-1"
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
