### Claves acceso SSH ###
resource "aws_key_pair" "apache-server-ssh" {
  # ssh-keygen -t rsa -b 2048 -f "apache-server"
  key_name = "${var.server_name}-ssh"
  public_key = file("${var.server_name}.pub")

  tags = {
    Name = "${var.server_name}-ssh"
    Owner = var.owner
    Team = var.team
  }
}