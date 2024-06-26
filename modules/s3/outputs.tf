output "s3_bucket" {
  value = aws_s3_bucket.s3.bucket
}

output "s3_id" {
  value = aws_s3_bucket.s3.id
}

output "s3_arn" {
  value = aws_s3_bucket.s3.arn
}

output "s3_domain_name" {
  value = aws_s3_bucket.s3.bucket_regional_domain_name
}

output "s3_role_arn" {
  value = aws_iam_role.s3-role.arn
}