data "template_file" "web_task" {
  template = "${file("${path.module}/templates/web_task_definition.json")}"

  vars {
    image           = var.image
  }
}

data "terraform_remote_state" "ecs" {
  backend = "s3"

  config = {
    bucket   = "mi-terraform-state-bucket"
    key      = "ecs.state"
    region   = "us-east-1"
  }
}