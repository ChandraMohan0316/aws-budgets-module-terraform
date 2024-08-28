output "budget_id" {
  description = "Created Budget's IDs"
  value       = [for budget in aws_budgets_budget.budget : budget.id]
}

output "arn" {
  description = "Created Budget's ARN"
  value       = [for budget in aws_budgets_budget.budget : budget.arn]
}