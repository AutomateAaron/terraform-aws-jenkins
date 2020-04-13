# terraform-aws-jenkins

This is a terraform module to create

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

| Name                | Description |
| ------------------- | ----------- |
| next_steps          | n/a         |
| public_ip           | n/a         |
| ssh_connect_command | n/a         |
| url                 | n/a         |
