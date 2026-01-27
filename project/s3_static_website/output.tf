output "bucket_name" {

    value = aws_s3_bucket.my_bucket.id
    description = "value of the bucket name"
  
}
output "bucket_url" {

    value = "https://${aws_s3_bucket.my_bucket.bucket_regional_domain_name}"
    description = "URL of the S3 bucket"
  
}

output "bucket_arn" {

    value = aws_s3_bucket.my_bucket.arn
    description = "ARN of the S3 bucket"
  
}