output "security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "ec2_sg_arn" {
  value = aws_security_group.ec2_sg.arn
}

output "efs_sg_id" {
  value = aws_security_group.efs_sg.id
}