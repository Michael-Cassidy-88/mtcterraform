//--------------------------------------------------------------------
// Variables



//--------------------------------------------------------------------
// Modules
module "compute" {
  source  = "app.terraform.io/Michael-Cassidy/compute/aws"
  version = "1.0.0"

  aws_region          = "us-east-1"
  public_key_material = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEijazuVgxsWss18iwRUUx3gldCa3FSdLo6zgNFlhNQKPBhxpNhoUJed7aVU4tHAz0MTXknPcAKrhwcyHZ4ENxVAWGudpRPr0Puba8pEZTQNa1+jJio93oKn7qgXEwB7nANjl54jSMjz0kdYNQqC+5y/un1zXFmqaip8hZCezENaDtou8E5p/+8qe60gxZk3/fekhtWb+h0DMJOzI73oFfHxY/OJyMfNI9qcut0VEK/FWC8eSFxrF8pK8RAbk9Gh7gdSCmWbXAkh329NCCBM0CkzVeQheGM6RWTUjj+H6Pq+sLRbxzn3388dbnEDnXdW4bYilAe6/PRK8zM4Bem7FV ubuntu@ip-172-31-89-121"
  public_sg           = module.networking.public_sg
  public_subnets      = module.networking.public_subnets
}

module "networking" {
  source  = "app.terraform.io/Michael-Cassidy/networking/aws"
  version = "1.0.0"

  access_ip  = "0.0.0.0/0"
  aws_region = "us-east-1"
}