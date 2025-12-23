resource "aws_instance" "devops" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  associate_public_ip_address = true

  user_data = file("user_data_jenkins.sh")

  tags = {
    Name = "jenkins-server"
  }
}

