resource "aws_cloudwatch_log_group" "yada" {
  name = "${var.app_name}-logs"
}
