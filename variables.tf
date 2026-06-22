variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-2"
}

variable "alb_arn_suffix" {
  description = "ARN suffix of the ALB"
  type        = string
}

variable "notification_email" {
  description = "Email address that receives CloudWatch alarm notifications"
  type        = string
}

variable "log_retention_days" {
  description = "Days to retain log group entries"
  type        = number
  default     = 14
}

variable "monthly_budget_usd" {
  description = "Monthly budget ceiling in USD"
  type        = number
  default     = 25
}

variable "estimated_charges_threshold" {
  description = "USD amount that triggers the EstimatedCharges alarm"
  type        = number
  default     = 10
}