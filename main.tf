provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-061fe7df6ad657197"
  instance_type          = "t2.medium"
  key_name               = "newkeypair"
  vpc_security_group_ids = ["sg-0fb2de3f44f20e2e2"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
