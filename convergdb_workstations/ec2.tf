# ConvergDB - DevOps for Data
# Copyright (C) 2018 Beyondsoft Consulting, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

resource "aws_security_group" "convergdb_workstation" {
  name        = "convergdb_security_group"
  description = "allows convergdb workstations to be accessed"
  vpc_id      = "${var.vpc_id}"

  # ssh support
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # https CLI via wetty
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    # prefix_list_ids = ["pl-12c4e678"]
  }
}

resource "aws_instance" "convergdb_workstation" {
  count                   = "${var.instance_count}"
  ami                     = "${var.ami_id}"
  instance_type           = "${var.instance_type}"
  subnet_id               = "${var.subnet_id}"
  vpc_security_group_ids  = ["${aws_security_group.convergdb_workstation.id}"]
  key_name                = "${var.key_name}"
  iam_instance_profile    = "${aws_iam_instance_profile.convergdb_workstation.name}"
  tags {
    Name = "ConvergDB Workstation ${count.index}"
  }
}

output "workstation_private_dns" {
  value = "${join("\n", formatlist("https://%s:3000/wetty", aws_instance.convergdb_workstation.*.private_dns))}"
}

output "workstation_public_dns" {
  value = "${join("\n", formatlist("https://%s:3000/wetty", aws_instance.convergdb_workstation.*.public_dns))}"
}