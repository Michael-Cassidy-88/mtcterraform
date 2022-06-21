~> 2.16.0  
# allows the last item in the variable to change up to the highest number

terraform plan -destroy  
# allows you to see the resources that will be destroyed in a plan 

curl http://169.254.169.254/latest/meta-data/public-ipv4 
# outputs the IP address of your current instance

terraform.tfstate.backup 
# holds everything from the previous state file

sudo apt install jq
# installs a Linux command line utility that can extrat data from JSON files

terraform show -json | jq 
# outputs the info from our state file

terraform state list
# shows all resources in our state file

terraform console
# cli tool to access the state file

terraform output
# shows only the outputs, but only after apply

join(":", [docker_container.nodered_container.ip_address, docker_container.nodered_container.ports[0].external])
# within the terraform console, joins the IP Address of the container and the first external port