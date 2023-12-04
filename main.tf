provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "my_instance"{
    ami = "ami-089c26792dcb1fbd4"
    instance_type = "t2.micro"

    tags = {
        Name = "my-first-ec2"
    }
}
