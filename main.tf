provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 2
  ami                    = "ami-061fe7df6ad657197"
  instance_type          = "t2.medium"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-00c549897f85df846"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
