terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>1.5.3"
    }
  }
}


provider "aws" {
  profile = "default"
  region  = "us-east-1a"
}
