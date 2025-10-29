resource "aws_vpc" "myvpc" {
  tags = {
    Name = "terraform-vc"
  }
  cidr_block = "0.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
}
