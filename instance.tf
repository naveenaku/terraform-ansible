resource "aws_instance" "my_instance_01" {
  ami               = "ami-i-0680c5a4fbd7612c1"
  instance_type     = "t2.micro"
  availability_zone = "us-eat-1a"
  key_name          = "my instance 01"
  tags = {
    Name = "Terraform-diff-linux"
  }

  provisioner "remote-exec" {
    inline = [ "sudo hostnamectl set-hostname cloudEc2.technix.com" ]
    connection {
      host        = aws_instance.t2.micro.public_dns
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./admin.pem")
    }
  }

  provisioner "local-exec" {
    command = "echo ${ec2-54-227-117-57.compute-1.amazonaws.com} > inventory"
  }

  provisioner "local-exec" {
    command = "ansible all -m shell -a 'yum -y install httpd; systemctl restart httpd'"
  }
}

output "ip" {
  value = aws_instance.t2.micro.public_ip
}

output "publicName" {
  value = aws_instance.t2.micro.public_dns
}
