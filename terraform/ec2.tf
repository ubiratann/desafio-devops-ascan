resource "aws_network_interface" "interface" {
  subnet_id       = aws_default_subnet.subnet_a.id
  security_groups = [aws_security_group.sg.id]
}

resource "aws_instance" "ec2" {
  ami                  = var.ami
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.profile.name
  user_data            = data.template_file.user_data.rendered
  key_name             = var.key_par_name

  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/templates/user_data.tpl")
}
