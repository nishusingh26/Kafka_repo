output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = module.alb_module.alb_arn
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = module.alb_module.target_group_arn
}
