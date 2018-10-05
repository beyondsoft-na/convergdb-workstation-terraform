# ConvergDB AWS Workstation

This repo contains the objects needed to instantiate any number of ConvergDB workstations in AWS. These workstations are created from a publicly available AMI provided by Beyondsoft.

## Workstation features

ConvergDB workstations are created by way of a publicly available AMI created and maintained by Beyondsoft. This workstation can be accessed in two ways:

* ssh
* web based TTY (terminal emulator)

Once you are logged into the server as `convergdb` user, the following software is fully functional:

* convergdb
* terraform
* AWS CLI
* git (with AWS CodeCommit configured)

When built using the module in this repo, the instance role attached to your workstation instance will have all of the necessary AWS permissions to build infrastructure with convergdb and terraform.

## Module features

The terraform module in this repo provides the following features:

* IAM role, policy, and instance profile with all of the permissions needed to operate convergdb and terraform.
* Ability to instantiate 0 to n instances. This is useful for training or hands-on presentation purposes.
* Creates the VPC security group used by the instances.

## Using the module

The following is an example of how to use the module:

```
provider "aws" {
  region = "us-east-1"
}

data "aws_region" "current" {}

module "workstations" {
  source         = "./convergdb_workstations/"
  instance_count = 15
  instance_type  = "t3.small"
  region         = "${data.aws_region.current.name}"
  vpc_id         = "vpc-00000000"
  subnet_id      = "subnet-11111111"
  key_name       = "your-key-name"
  providers = {
    aws = "aws"
  }
}

output "workstations_public_dns" {
  value = "${module.workstations.workstation_public_dns}"
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

## License

ConvergDB - DevOps for Data
Copyright (C) 2018 Beyondsoft Consulting, Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
