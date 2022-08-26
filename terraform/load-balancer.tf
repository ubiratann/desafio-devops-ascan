resource "aws_lb" "loadbalancer" {
  internal           = false
  name               = "ngnix-load-balancer"
  subnets            = ["${aws_default_subnet.subnet_a.id}", "${aws_default_subnet.subnet_b.id}"]
  security_groups    = [aws_security_group.sg.id]
  load_balancer_type = "application"
}

resource "aws_lb_target_group" "lb_target_group" {

  name     = "ngnix-target-group"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
}

resource "aws_lb_listener" "lb_listener" {

  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = aws_instance.ec2.id
  port             = 80
}
