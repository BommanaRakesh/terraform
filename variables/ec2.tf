
resource "aws_instance" "my_ec2" {
  ami           = "ami-0055977a6e828a4f4"
  instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id]


  tags = {
    Name = "Terraformnew"
    terraform="true"
  }
}

resource "aws_security_group" "allow_all" {
  name   = "allow_all"
   
   egress {
    from_port       = 0 # from_port port 0 to 0 means allow_all ports
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     =["0.0.0.0/0"] # internet
    
  }
    ingress {
    from_port       = 0 # from_port port 0 to 0 means allow_all ports
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     =["0.0.0.0/0"] # internet
    }
    tags = {
        name = "allow-all"
    }
}

