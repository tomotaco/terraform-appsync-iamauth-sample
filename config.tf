terraform {
    required_version = ">= 1.2.4"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.28.0"
        }
    }

    backend "s3" {
        bucket = "your-aws-s3-bucket-name"
        key = "terraform/appsync.tfstate"
        region = "your-aws-region"
        shared_credentials_file = "~/.aws/credentials"
        profile = "your-aws-profile-name"
    }
}

provider "aws" {
    region = "your-aws-region"
    profile = "your-aws-profile-name"
}