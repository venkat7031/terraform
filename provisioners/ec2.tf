resource "aws_instance" "roboshop" {
  ami           = var.aws_ami_id
  instance_type = var.aws_instance_type
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]

  tags = var.tag_name


   provisioner "local-exec" {
      command = "echo ${self.private_ip} > inventory"
      on_failure = continue
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
     ]
    
  }
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