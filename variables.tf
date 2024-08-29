variable "aws_budgets" {
  description = <<EOF
   A map of AWS budgets to be created. Each budget includes the following keys:
    - name: The unique name of the AWS budget.
    - budget_type: The type of budget, e.g., COST, USAGE, SAVINGS_PLANS_UTILIZATION, etc.
    - limit_amount: The monetary limit for the budget.
    - limit_unit: The unit of currency for the budget, typically USD.
    - cost_filters: A map of cost filters to apply to the budget, such as service or tag-based filters.
    - cost_types: Specifies the types of costs included in the budget, with the following sub-keys:
      - include_tax: Whether to include taxes in the budget.
      - include_subscription: Whether to include subscriptions in the budget.
      - use_blended: Whether to use blended costs (amortized cost across accounts) in the budget.
    - time_unit: The time period unit for the budget, such as MONTHLY or QUARTERLY.
    - notification_threshold_type: The type of threshold for notifications, either PERCENTAGE or ABSOLUTE_VALUE.
    - notification_comparison_operator: The comparison operator for notifications, such as LESS_THAN, EQUAL_TO, or GREATER_THAN.
    - time_period_start: The start date for the budget's time period.
    - time_period_end: The end date for the budget's time period.
    - notification_type: The type of notification, such as ACTUAL or FORECASTED.
    - notification_threshold: The threshold amount or percentage for triggering a notification.
    - subscriber_email_addresses: A list of email addresses to receive notifications.
    EOF
  type = map(object({
    name         = string
    budget_type  = string
    limit_amount = number
    limit_unit   = string
    # cost_filters = map(string)
    cost_types = object({
      include_tax          = bool
      include_subscription = bool
      use_blended          = bool
    })
    time_unit                        = string
    notification_threshold_type      = string
    notification_comparison_operator = string
    time_period_start                = string
    time_period_end                  = string
    notification_type                = string
    notification_threshold           = number
    subscriber_email_addresses       = list(string)
  }))

  validation {
    condition = alltrue([
      for k, v in var.aws_budgets : contains(["LESS_THAN", "EQUAL_TO", "GREATER_THAN"], v.notification_comparison_operator)
    ])
    error_message = "Can be LESS_THAN, EQUAL_TO or GREATER_THAN."
  }

  validation {
    condition = alltrue([
      for k, v in var.aws_budgets : contains(["PERCENTAGE", "ABSOLUTE_VALUE"], v.notification_threshold_type)
    ])
    error_message = "Can be PERCENTAGE OR ABSOLUTE_VALUE."
  }

  validation {
    condition = alltrue([
      for k, v in var.aws_budgets : contains(["ACTUAL", "FORECASTED"], v.notification_type)
    ])
    error_message = "Can be EMAIL or SNS."
  }

}

