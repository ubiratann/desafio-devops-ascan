resource "aws_iam_role" "instance_role" {
  name               = "ecsInstanceRole"
  assume_role_policy = data.aws_iam_policy_document.instance_policy.json
}

resource "aws_iam_role_policy_attachment" "instance_attachment" {
  role       = aws_iam_role.instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "profile" {
  name = "ecsInstanceRole"
  role = aws_iam_role.instance_role.id
}

resource "aws_iam_role" "service_role" {
  name               = "ecsServiceRole"
  assume_role_policy = data.aws_iam_policy_document.service_policy.json
}

resource "aws_iam_role_policy_attachment" "service_attachment" {
  role       = aws_iam_role.service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

resource "aws_iam_role" "task_execution_role" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.tasks_execution_policy.json
}

resource "aws_iam_role_policy_attachment" "tasks_execution_role" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
