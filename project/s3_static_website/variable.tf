variable "bucket_name" {

    description = "The name of the S3 bucket"
    type = string
  
}

variable "block_public_acls" {

    description = "value to block public ACLs"
    type = bool
  
}

variable "block_public_policy" {

    description = "value to block public policies"
    type = bool
  
}

variable "ignore_public_acls" {

    description = "value to ignore public ACLs"
    type = bool
  
}

variable "restrict_public_buckets" {

    description = "value to restrict public buckets"
    type = bool
  
}

variable "status" {

    description = "Versioning status for the S3 bucket"
    type = string
  
}