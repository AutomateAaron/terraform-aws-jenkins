# terraform-aws-jenkins

This terraform module stands up a simple Jenkins Server running in docker on an EC2 instance.

## Example:

```hcl
module "jenkins" {
  source       = "git@github.com:AaronNBrock/terraform-aws-jenkins.git"
  ssh_key_name = "my-key"
}
```

**Note:** It's best practices to specify `?ref=<git-tag>` at the end of the `source` line.

## Spec

## Requirements

| Name     | Version |
| -------- | ------- |
| aws      | ~> 2.0  |
| template | ~> 2.1  |

## Providers

| Name     | Version |
| -------- | ------- |
| aws      | ~> 2.0  |
| template | ~> 2.1  |

## Inputs

| Name         | Description                                      | Type     | Default | Required |
| ------------ | ------------------------------------------------ | -------- | ------- | :------: |
| jenkins_port | The port the server will use for HTTP requests   | `number` | `8080`  |    no    |
| name_prefix  | A prefix added to all named resources            | `string` | `""`    |    no    |
| name_suffix  | A suffix added to all named resources            | `string` | `""`    |    no    |
| ssh_key_name | The name of an ssh key to deploy to the servers. | `string` | n/a     |   yes    |

## Outputs

| Name                | Description                                            |
| ------------------- | ------------------------------------------------------ |
| next_steps          | The next steps to configure your jenkins instance.     |
| public_ip           | The public ip address of the jenkins instance.         |
| ssh_connect_command | The command to connect to the jenkins server over ssh. |
| url                 | The http endpoint to the jenkins server.               |
