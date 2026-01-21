resource "aws_instance" "roboshop" {
  ami           = var.aws_ami_id
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  tags = var.tag_name
}


resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.description_name
  
ingress {
    from_port        = var.from_port
    to_port          = var.To_port
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


egress {
    from_port        = var.from_port
    to_port          = var.To_port
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}