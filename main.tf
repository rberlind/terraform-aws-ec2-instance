terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "ubuntu" {
  ami               = "${var.ami_id}"
  instance_type     = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"

  tags {
    Name        = "${var.name}"
    TTL         = "${var.ttl}"
    Owner       = "${var.owner}"
  }
}

resource "null_resource" "test_saas_local_exec_sudo" {
   provisioner "local-exec" {
       command = "sudo whoami"
   }
}
