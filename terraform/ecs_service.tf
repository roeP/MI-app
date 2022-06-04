resource "aws_ecs_service" "web_app_service" {
  name            = "mi_app_service"
  cluster         = data.terraform_remote_state.ecs.id
  task_definition = aws_ecs_task_definition.web_app_task.arn
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.foo.arn
    container_name   = "app"
    container_port   = 8080
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1a]"
  }
}