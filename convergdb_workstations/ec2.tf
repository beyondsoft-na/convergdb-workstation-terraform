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
  count                = "${var.instance_count}"
  ami                  = "${var.ami_id}"
  instance_type        = "t3.micro"
  subnet_id            = "${var.subnet_id}"
  security_groups      = ["${aws_security_group.convergdb_workstation.id}"]
  key_name             = "${var.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.convergdb_workstation.name}"
  tags {
    Name = "ConvergDB Workstation ${count.index}"
  }
}