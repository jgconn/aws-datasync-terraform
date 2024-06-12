resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_iam_role" "s3-role" {
  name = "datasync-s3-role"
  assume_role_policy = data.aws_iam_policy_document.policy_document.json

  inline_policy {
    name = "s3-efs-policy"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = [
                "s3:*",
                "datasync:*",
                "elasticfilesystem:*"
            ]
            Effect = "Allow"
            Resource = "*"
        }]
    })
  }
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["datasync.amazonaws.com"]
    }
  }
}