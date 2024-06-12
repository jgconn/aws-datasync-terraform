module "ec2" {
  source            = "./modules/ec2"
  instance_name     = "testing-datasync"
  instance_type     = "t2.micro"
  ami               = "ami-0e326862c8e74c0fe"
  security_group_id = module.security_group.security_group_id
  subnet_id         = "subnet-00d1a2fa5773b270b"
  availability_zone = "ap-southeast-2a"
}

module "security_group" {
  source              = "./modules/security_groups"
  security_group_name = "testing-datasync-sg"
  vpc_id              = "vpc-0c839e5d03adfc1db"
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "datasync-test023"
}

module "efs" {
  source = "./modules/efs"
  subnet_id = "subnet-00d1a2fa5773b270b"
  efs_sg_id = module.security_group.efs_sg_id
}

module "datasync" {
  source = "./modules/datasync"
  s3_arn = module.s3.s3_arn
  s3_role_arn = module.s3.s3_role_arn
  subnet_arn = "arn:aws:ec2:ap-southeast-2:730335392149:subnet/subnet-00d1a2fa5773b270b"
  ec2_sg_arn = module.security_group.ec2_sg_arn
  efs_mt_arn = module.efs.efs_mt_arn
}