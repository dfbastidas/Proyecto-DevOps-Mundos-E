### Resource ###
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-instance-profile"
  role = "ec2-admin"
}

resource "aws_instance" "remote-host-control" {
  ami = var.ami_id #ubuntu
  instance_type = var.instance_type

  # ejecutar un script inmediatamente despues de crear la instancia EC2:
  user_data = "${file("set-k8s-host-control.sh")}"

  # Asigna la llave que hemos creado a la instancia:
  key_name = aws_key_pair.remote-host-control-ssh.key_name

  # Asigna los SG a la instancia:
  vpc_security_group_ids = [
    aws_security_group.remote-host-control-sg.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = var.server_name
    Owner = var.owner
    Team = var.team
  }
}