terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }

    backend "s3" {
        bucket = "bucket_name"
        key = "prod/terraform.tfstate"
        region = "ap-south-1"
    }
}

