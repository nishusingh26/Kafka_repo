output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.my_alb.arn
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.my_target_group.arn
}
