resource "aws_budgets_budget" "budget" {
  for_each          = var.aws_budgets
  name              = each.value.name
  budget_type       = each.value.budget_type
  limit_amount      = each.value.limit_amount
  limit_unit        = each.value.limit_unit
  time_unit         = each.value.time_unit
  time_period_start = each.value.time_period_start
  time_period_end   = each.value.time_period_end

  dynamic "cost_filter" {
    for_each = each.value.cost_filters
    content {
      name   = cost_filter.key
      values = [cost_filter.value]
    }
  }

  cost_types {
    include_tax          = each.value.cost_types.include_tax
    include_subscription = each.value.cost_types.include_subscription
    use_blended          = each.value.cost_types.use_blended
  }

  notification {
    comparison_operator        = each.value.notification_comparison_operator
    notification_type          = each.value.notification_type
    threshold                  = each.value.notification_threshold
    threshold_type             = each.value.notification_threshold_type
    subscriber_email_addresses = each.value.subscriber_email_addresses
  }
}
