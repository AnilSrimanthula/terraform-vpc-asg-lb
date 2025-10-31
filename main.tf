resource "aws_launch_template" "mylt" {
name = "terr-lt"
description = "terraform-code"
image_id = "ami-00af95fa354fdb788"
instance_type = "t2.micro"
key_name = "k8s"
placement {
availability_zone = "ap-south-1a"
}
vpc_security_group_ids = [aws_security_group.mysg.id]
user_data = filebase64("/root/terraform-vpc-asg-lb/netflix.sh")
}

resource "aws_elb" "mylb" {
name = "terra-lb"
subnets = [aws_subnet.mysubnet1.id , aws_subnet.mysubnet2.id]
security_groups = [aws_security_group.mysg.id]
listener {
instance_port = 80
instance_protocol = "http"
lb_port = 80
lb_protocol = "http"
}
}

resource  "aws_autoscaling_group" "mysg" {
name = "terra-sg"
launch_template {
id = aws_launch_template.mylt.id
}
min_size = 2
max_size = 4
desired_capacity = 2
load_balancers = [aws_elb.mylb.id]
vpc_zone_identifier = [aws_subnet.mysubnet1.id, aws_subnet.mysubnet2.id]
}
