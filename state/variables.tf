variable "aws_ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
  
}


variable "aws_instance_type" {
    default = "t3.micro"
  
}
variable "tag_name" {
    type = map(string)
    default = {
        Name: "roboshop"
    }
}

variable "sg_name" {
    type = string
    default = "allow_all"
  
}

variable "description_name" {
    default = "allow all traffic"
}

variable "from_port" {
    default = 0
}

variable "To_port" {
    default = 0
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    default = {
        Name: "allow_all"
    }
}