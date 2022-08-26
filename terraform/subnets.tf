resource "aws_default_subnet" "subnet_a" {
  availability_zone = "${var.region}a"
}

resource "aws_default_subnet" "subnet_b" {
  availability_zone = "${var.region}b"
}
