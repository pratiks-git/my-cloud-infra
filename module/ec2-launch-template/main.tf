
data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "this" {

    ami = data.aws_ami.amzn-linux-2023-ami.id
    instance_type = "t2.micro"

    key_name = "dev-key"
    vpc_security_group_ids = ["sg-06b3f88a2ec393936"]

    subnet_id = "subnet-0f4504a49d6aa390a"
    tags = {
        Name = "my-test-server"
        Created_by= "terraform"
    }
    
}

# resource "aws_instance" "mysql-server" {
#     ami = data.aws_ami.amzn-linux-2023-ami.id
#     instance_type = "t2.micro"

#     key_name = "dev-key"
#     vpc_security_group_ids = ["sg-06b3f88a2ec393936"]

#     subnet_id = "subnet-00a79d2e7be12c6bd"
#     tags = {
#         Name = "mysql-db-server"
#         Created_by= "terraform"
#     }
    
# }

# resource "aws_instance" "grafana" {

#     ami = data.aws_ami.amzn-linux-2023-ami.id
#     instance_type = "t2.micro"

#     key_name = "dev-key"
#     vpc_security_group_ids = ["sg-06b3f88a2ec393936"]

#     subnet_id = "subnet-0f4504a49d6aa390a"
#     tags = {
#         Name = "grafana-test-server"
#         Created_by= "terraform"
#     }
    
# }