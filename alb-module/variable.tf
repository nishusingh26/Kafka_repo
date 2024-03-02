variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "internal" {
  description = "Whether the ALB is internal or external"
  type        = bool
}

variable "security_groups" {
  description = "List of security group IDs for the ALB"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection for the ALB"
  type        = bool
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "Port for the target group"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocol for the target group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "health_check_path" {
  description = "Path for the health check"
  type        = string
}

variable "health_check_protocol" {
  description = "Protocol for the health check"
  type        = string
}

variable "health_check_port" {
  description = "Port for the health check"
  type        = number
}

variable "health_check_interval" {
  description = "Interval for the health check"
  type        = number
}

variable "health_check_timeout" {
  description = "Timeout for the health check"
  type        = number
}

variable "health_check_healthy_threshold" {
  description = "Healthy threshold for the health check"
  type        = number
}

variable "health_check_unhealthy_threshold" {
  description = "Unhealthy threshold for the health check"
  type        = number
}

variable "listener_port" {
  description = "Port for the listener"
  type        = number
}

variable "listener_protocol" {
  description = "Protocol for the listener"
  type        = string
}

variable "private_instance_ids" {
  description = "List of private instance IDs to register with the ALB target group"
  type        = list(string)
}

