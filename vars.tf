
variable "name_prefix" {
  description = "A prefix added to all named resources"
  default     = ""
}

variable "name_suffix" {
  description = "A suffix added to all named resources"
  default     = ""
}

variable "ssh_key_name" {
  description = "The name of an ssh key to deploy to the servers."
  type        = string
}

variable "jenkins_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "iam_instance_profile" {
  description = "The iam instance profile the instance should use"
  type        = string
  default     = null
}
