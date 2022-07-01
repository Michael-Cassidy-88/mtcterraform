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

count
# accepts a whole number, and creates that many instances of the resource or module

count.index
# The index number corresponding to the instance

docker_container.nodered_container[*].name
# uses the splat expression within the terraform console to receive every name of the nodered containers that have been created

[for i in docker_container.nodered_container[*]: i.name]
# within the terraform console, lists every name of the nodered containers that have been created

[for i in docker_container.nodered_container[*]: i.ports[0]["external"]]
# within the terraform console, lists every external port of the nodered containers that have been created

[for i in docker_container.nodered_container[*]: i.ports[*]["external"]]
# within the terraform console, makes one list for each external port of the nodered containers that have been created

docker rm -f $(docker ps -a -q)
# removes all containers

docker rmi -f $(docker images -q)
# removes all docker images

terraform taint random_string.random[0]
# taints the random_string resource 

terraform untaint random_string.random[0]   
# untaints the resource

terraform apply --auto-approve -lock=false
# disables state locking. Can corrupt your state. If you run another apply at the same time, one resource will be in the state, and other will not

docker inspect --format="{{.ID}}" nodered-5nug
# prints the ID of the specified container

terraform import docker_container.nodered_container2 $(docker inspect --format="{{.ID}}" nodered-5nug)
# runs a bash command to import the specified container into our Terraform file

terraform refresh
# updates the state file, but not the real remote objects. If the change requires a new apply, nothing happens

terraform refresh -target <TARGET>
# updates only in the resource specified as the target

terraform state rm random_string.random[1]
# removes resource from state file, and creates an extra backup state file

export TF_VAR_ext_port=1880
# exports the variable "ext_port" and sets it equal to "1880" so that Terraform knows to use it

unset TF_VAR_ext_port
# unsets the variable

terraform plan --var-file west.tfvars
# pulls the "west" variable. CLI overrides the files

max([10, 20, 30]...)
# max function allows you to pull the items out of the list and evaluate them individually

path.cwd
# path of the current working directory

"${path.cwd}/noderedvol"
# interpolation, which allows you to access a variable within a string

lookup({dev = "image1", prod = "image2"}, "dev")
# looks up the dev vaariable

lookup(var.image, "dev")
# looks up the dev environment for the variable image

terraform workspace new dev
# creates and switches to a new workspace called "dev"

terraform workspace show
# displays the workspace you are in

terraform workspace list
# lists the workspaces you have created

terraform workspace select dev
# selects the workspace you want to be in 

terraform graph -type=plan-destroy | dot -Tpdf > graph-applied.pdf
# makes a graph displaying the destroy plan and puts it into a pdf

terraform destroy -target=module.container[0].docker_container.nodered_container
# destroys one container

keys(local.deployment)
# within terraform console, displays the keys to the locals block

values(local.deployment["nodered"])
# within terraform console, displays the values to the nodered key

{for x in [1, 2, 3, "blue"]: x => "fish"}
# creates a map 

cidrsubnet("10.123.0.0/16", 8, 1)
# gives you "10.123.1.0/24"