resource "aws_subnet" "mysubnet1" {
tags = {
Name = "mysubnet1"
}
vpc_id = aws_vpc.myvpc.id
cidr_block = "10.0.0.0/24"
availability_zone = "ap-south-1a"
map_public_ip_on_launch = "true"
}

resource "aws_subnet" "mysubnet2" {
tags = {
Name = "mysubnet2"
}
vpc_id = aws_vpc.myvpc.id
cidr_block = "10.0.1.0/24"
availability_zone = "ap-south-1b"
map_public_ip_on_launch = "true"
}
