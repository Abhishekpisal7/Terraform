provider "aws" {

    region = "ap-south-1"

}

resource "aws_s3_bucket" "my_bucket" {

    bucket = var.bucket_name

    tags = {
      "Owner" = "terraform_module" 
    }
  
}

resource "aws_s3_bucket_public_access_block" "public_access" {

    bucket = aws_s3_bucket.my_bucket.id

    block_public_acls = var.block_public_acls
    block_public_policy = var.block_public_policy
    ignore_public_acls = var.ignore_public_acls
    restrict_public_buckets = var.restrict_public_buckets

    depends_on = [ 
        aws_s3_bucket.my_bucket
    ]
  
}

resource "aws_s3_bucket_policy" "bucket_policy" {

    bucket = aws_s3_bucket.my_bucket.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = "*"
                Action = [
                    "s3:GetObject",
                    "s3:listBucket"
                ]
                Resource = [
                    "${aws_s3_bucket.my_bucket.arn}",
                    "${aws_s3_bucket.my_bucket.arn}/*"
                ]
            }
        ]
    })

    depends_on = [ 
        
        aws_s3_bucket_public_access_block.public_access
    
    ]
  
}

resource "aws_s3_bucket_website_configuration" "name" {

    bucket = aws_s3_bucket.my_bucket.id

    index_document {
        suffix = "index.html"
    }
  
}

resource "aws_s3_bucket_versioning" "versioning" {

    bucket = aws_s3_bucket.my_bucket.id

    versioning_configuration {
      
        status = var.status
    }
  
}

resource "aws_s3_object" "name" {

    bucket = aws_s3_bucket.my_bucket.id
    source = "./index.html"
    key = "index.html"
    content_type = "text/html" 

}