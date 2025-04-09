### module ###
module "remote_k8s_host" {
  source = "./remote-k8s-host-control"
  ami_id = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  server_name = "remote-host-control"
  owner = "diegofernando150@gmail.com"
  team = "devops"
}


### OUTPUTS ###
output "remote_k8s_host_public_ip" {
  description = "Dirección IP publica de la instancia EC2 QA:"
  value = module.remote_k8s_host.server_public_ip
}

output "remote_k8s_host_public_dns" {
  description = "DNS Publico de la instancia EC2 QA: "
  value = module.remote_k8s_host.server_public_dns
}

