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

resource "aws_iam_role" "convergdb_workstation" {
  name = "convergdb_workstation"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_caller_identity" "current" {}

data "template_file" "policy" {
  template = "${file("${path.module}/policy.json.tpl")}"

  vars {
    region     = "${var.region}"
    account_id = "${data.aws_caller_identity.current.account_id}"
  }
}

resource "aws_iam_policy" "convergdb_policy" {
  name = "convergdb_workstation_policy"
  policy = "${data.template_file.policy.rendered}"
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "${aws_iam_role.convergdb_workstation.name}"
  policy_arn = "${aws_iam_policy.convergdb_policy.arn}"
}

resource "aws_iam_instance_profile" "convergdb_workstation" {
  name = "convergdb_workstation"
  role = "${aws_iam_role.convergdb_workstation.name}"
}
