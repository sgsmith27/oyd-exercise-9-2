output "log_group_name" {
  description = "Name of the CloudWatch log group"
  value       = module.observability.log_group_name
}

output "alarm_topic_arn" {
  description = "ARN of the application alarm SNS topic"
  value       = module.observability.alarm_topic_arn
}

output "estimated_charges_alarm_arn" {
  description = "ARN of the EstimatedCharges alarm"
  value       = module.observability.estimated_charges_alarm_arn
}

output "budget_name" {
  description = "Name of the monthly AWS budget"
  value       = module.observability.budget_name
}

output "dashboard_url" {
  description = "Direct link to the CloudWatch dashboard"
  value       = module.observability.dashboard_url
}