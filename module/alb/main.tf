resource "aws_lb" "my_alb" {
  name               = var.alb_name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [var.security_groups]
  subnets            = var.subnets

  # enable_deletion_protection = var.enable_deletion_protection
}

resource "aws_lb_target_group" "my_target_group" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id

  health_check {
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    port                = var.health_check_port
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

// Register targets with the ALB target group
resource "aws_lb_target_group_attachment" "devops-tg" {
  for_each         = { for idx, id in var.private_instance_ids : idx => id }
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = each.value
}