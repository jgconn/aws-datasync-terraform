resource "aws_datasync_location_s3" "s3-location" {
  s3_bucket_arn = var.s3_arn
  subdirectory = "/"
  
  s3_config {
    bucket_access_role_arn = var.s3_role_arn
  }
}

resource "aws_datasync_location_efs" "efs-location" {
  efs_file_system_arn = var.efs_mt_arn
  subdirectory = "/"

  ec2_config {
    security_group_arns = [var.ec2_sg_arn]
    subnet_arn = var.subnet_arn
  }
}

resource "aws_datasync_task" "efs-to-s3-task" {
  name = "efs-to-s3-task"
  source_location_arn = aws_datasync_location_efs.efs-location.arn
  destination_location_arn = aws_datasync_location_s3.s3-location.arn
}
