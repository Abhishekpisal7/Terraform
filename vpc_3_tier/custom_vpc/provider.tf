terraform {
    required_version = "~> 1.14.4"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.13"
        }
    }
}

provider "aws" {
    region = "ap-south-1"
}