# output "aws_caller_identity" {
#   value = data.aws_caller_identity.current
# }

output "aws_instance_dns_ipv4" {
  value = aws_instance.ec2.public_dns
}

output "load_balancer_dns_name" {
  value = aws_lb.loadbalancer.dns_name
}
