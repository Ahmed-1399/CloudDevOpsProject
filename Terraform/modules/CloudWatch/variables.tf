variable "instance_id" {
  type        = string
  description = "The ID of the EC2 instance to monitor"
}

variable "alarm_name" {
  type        = string
  description = "The name of the CloudWatch alarm"
}

variable "alarm_actions" {
  type        = list(string)
  description = "List of actions to execute when the alarm state changes"
}
