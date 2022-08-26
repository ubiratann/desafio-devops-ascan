resource "aws_ecs_cluster" "cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "task_definition" {
  container_definitions    = data.template_file.task_definition_json.rendered
  family                   = "nginx"
  network_mode             = "host"
  memory                   = "512"
  cpu                      = "256"
  requires_compatibilities = ["EC2"]
  execution_role_arn       = aws_iam_role.task_execution_role.arn
}

resource "aws_ecs_service" "service" {
  cluster         = aws_ecs_cluster.cluster.id
  desired_count   = 1
  launch_type     = "EC2"
  name            = "ascan-service"
  task_definition = aws_ecs_task_definition.task_definition.arn

  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name   = "nginx"
    container_port   = 80
  }

}
