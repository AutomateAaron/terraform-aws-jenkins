provider "aws" {
  version = "~> 2"
  region  = "us-east-1"
}

#
# Variables
#
variable "ssh_key_name" {
  description = "The name of an ssh key to deploy to the servers."
  type        = string
}

#
# Modules
#
module "jenkins" {
  source       = "../"
  ssh_key_name = var.ssh_key_name
}


#
# Outputs
#
output "next_steps" {
  value = module.jenkins.next_steps
}

