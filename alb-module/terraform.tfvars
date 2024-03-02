aws_region                        = "us-west-2"
alb_name                          = "my-alb"
internal                          = false
security_groups                   = ["sg-0a27e14a7459287d5"]
subnets                           = ["subnet-03f345cbf21ed9465","subnet-088eb5c7c3e3551f9"]
enable_deletion_protection        = false
target_group_name                 = "my-target-group"
target_group_port                 = 80
target_group_protocol             = "HTTP"
vpc_id                            = "vpc-0b0d7f43363fce75f"
health_check_path                 = "/"
health_check_protocol             = "HTTP"
health_check_port                 = 80
health_check_interval             = 30
health_check_timeout              = 5
health_check_healthy_threshold    = 2
health_check_unhealthy_threshold  = 2
listener_port                     = 80
listener_protocol                 = "HTTP"
private_instance_ids = ["i-08b5b78a66b43f154","i-004ea4f77233fdff4"]
