## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.64.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.budget](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_budgets"></a> [aws\_budgets](#input\_aws\_budgets) | A map of AWS budgets to be created | <pre>map(object({<br>    name         = string<br>    budget_type  = string<br>    limit_amount = number<br>    limit_unit   = string<br>    cost_filters = map(string)<br>    cost_types = object({<br>      include_tax          = bool<br>      include_subscription = bool<br>      use_blended          = bool<br>    })<br>    time_unit                        = string<br>    notification_threshold_type      = string<br>    notification_comparison_operator = string<br>    time_period_start                = string<br>    time_period_end                  = string<br>    notification_type                = string<br>    notification_threshold           = number<br>    subscriber_email_addresses       = list(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Created Budget's ARN |
| <a name="output_budget_id"></a> [budget\_id](#output\_budget\_id) | Created Budget's IDs |
