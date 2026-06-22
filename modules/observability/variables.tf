variable "alb_arn_suffix" {
  description = "ARN suffix of the ALB used for CloudWatch dimensions"
  type        = string
}

variable "notification_email" {
  description = "Email address that receives SNS notifications"
  type        = string
}

variable "log_retention_days" {
  description = "Days to retain CloudWatch log events"
  type        = number
  default     = 14
}

variable "monthly_budget_usd" {
  description = "Monthly budget ceiling in USD"
  type        = number
}

variable "estimated_charges_threshold" {
  description = "USD amount that triggers the EstimatedCharges alarm"
  type        = number
}

variable "aws_region" {
  description = "AWS region used for regional CloudWatch resources"
  type        = string
}