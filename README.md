# ConvergDB AWS Workstation

This repo contains the objects needed to instantiate any number of ConvergDB workstations in AWS. These workstations are created from a publicly available AMI provided by Beyondsoft.

## Workstation features

ConvergDB workstations are created by way of a publicly available AMI created and maintained by Beyondsoft. This workstation can be accessed in two ways:

* ssh
* web based TTY (terminal emulator)

Once you are logged into the server as `convergdb` user, the following software is fully functional:

* ConvergDB
* Terraform
* AWS CLI

When built using the module in this repo, the instance role attached to your workstation instance will have all of the necessary AWS permissions to use the installed tools.

## Module features

The terraform module in this repo provides the following features:

* IAM role, policy, and instance profile with all of the permissions needed to operate ConvergDB and Terraform.
* Ability to instantiate 1 to n instances. This is useful for training or hands-on presentation purposes.
* Creates the VPC security group used by the instances.

## Using the module

The following is an example of how to use the module:

```
provider "aws" {
  alias  = "default"
  region = "us-east-1"
  profile = "bci"
}

data "aws_region" "current" {}

module "workstations" {
  source         = "./convergdb_workstations/"
  instance_count = 3
  instance_type  = "t3.small"
  region         = "${data.aws_region.current.name}"
  vpc_id         = "vpc-00000000"
  subnet_id      = "subnet-11111111"
  key_name       = "your-key-name"
}
```

## Web based terminal

ConvergDB workstations provide access to the instance by way of [wetty](https://github.com/krishnasrinivas/wetty) (web TTY)... a node application which serves up a TTY based terminal, all within a browser page.

When a workstation is instantiated... a self-signed TLS certificate is created. This will raise an error/warning when you access the page... but it does encrypt the traffic, even if it's not validating the server.

In order to access the terminal... connect to:

```
https://workstation-hostname:3000/wetty
```

* default username = `convergdb`
* default password = `convergdb`

