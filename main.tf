resource "aws_vpc" "vpctest" {
    cidr_block = "10.0.0.0/18"

    tags = { 
      Name = "vpc test" 
    }
}
resource "aws_instance" "gauthier" {
  ami             = "ami-0c02fb55956c7d316"
  instance_type   = "t2.micro"

}
resource "aws_security_group" "test_sg" {
  name        = "test_sg"
  description = "Allow traffic"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "gauthier"
  }
}