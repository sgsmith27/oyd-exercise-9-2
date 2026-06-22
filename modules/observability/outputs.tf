output "log_group_name" {
  description = "Name of the FinAPI CloudWatch log group"
  value       = aws_cloudwatch_log_group.finapi.name
}

output "alarm_topic_arn" {
  description = "ARN of the SNS topic used for application alarms"
  value       = aws_sns_topic.alerts.arn
}

output "estimated_charges_alarm_arn" {
  description = "ARN of the EstimatedCharges CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.estimated_charges.arn
}

output "budget_name" {
  description = "Name of the monthly AWS budget"
  value       = aws_budgets_budget.monthly.name
}

output "dashboard_url" {
  description = "Direct link to the CloudWatch dashboard"
  value       = "https://${var.aws_region}.console.aws.amazon.com/cloudwatch/home?region=${var.aws_region}#dashboards:name=${aws_cloudwatch_dashboard.main.dashboard_name}"
}