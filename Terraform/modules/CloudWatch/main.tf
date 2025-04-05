resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300  # 5 Minutes
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "This alarm triggers when CPU utilization exceeds 70% for two consecutive periods."

  # alarm_actions ---> should be executed when the alarm state changes.
  actions_enabled     = true

  # is required to associate the CloudWatch Alarm with a specific EC2 instance
  dimensions = {
    InstanceId = var.instance_id
  }

  # Will send alert to SNS
  alarm_actions = var.alarm_actions
}
