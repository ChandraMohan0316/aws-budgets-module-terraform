aws_budgets = {
  budget1 = {
    name         = "Monthly Total Budget"
    budget_type  = "COST"
    limit_amount = 100.0
    limit_unit   = "USD"
    # cost_filters = {
    #   Service = "Amazon Elastic Compute Cloud - Compute"
    # }
    cost_types = {
      include_tax          = true
      include_subscription = true
      use_blended          = false
    }
    time_unit                        = "MONTHLY"
    time_period_start                = "2024-01-01_00:00"
    time_period_end                  = "2024-12-01_00:00"
    notification_type                = "ACTUAL"
    notification_comparison_operator = "GREATER_THAN"
    notification_threshold_type      = "PERCENTAGE"
    notification_threshold           = 80.0
    subscriber_email_addresses       = ["admin@example.com"]
  }

#   budget2 = {
#     name        = "Monthly S3 Budget"
#     budget_type = "COST"

#     limit_amount = 50.0
#     limit_unit   = "USD"
#     # cost_filters = {
#     #   Service = "Amazon Simple Storage Service"
#     # }
#     cost_types = {
#       include_tax          = true
#       include_subscription = true
#       use_blended          = false
#     }
#     time_unit                        = "MONTHLY"
#     time_period_start                = "2024-01-01_00:00"
#     time_period_end                  = "2024-12-01_00:00"
#     notification_type                = "ACTUAL"
#     notification_comparison_operator = "GREATER_THAN"
#     notification_threshold_type      = "PERCENTAGE"
#     notification_threshold           = 90.0
#     subscriber_email_addresses       = ["finance@example.com"]
#   }
}
