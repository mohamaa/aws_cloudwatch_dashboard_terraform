variable "nested_map_name" {
default = {
    instance1    = {
      name = "name1"
      value = "value1"
      color = "#d62728"
    }
    instance2    = {
      name = "name2"
      value = "value2"
      color = "#d62729"
    }
    instance3 = {
      name = "name3"
      value = "value3"
      color = "#d62730"
    }
    }
}
variable "aws_profile" {}
variable "aws_region" {}
variable "metric_name" {}
variable "namespace" {}

// Widget Properties

variable "height" {
  default = 6
}

variable "width" {
  default = 6
}

// Metric Object Properties

variable "region" {
  default = "us-east-1"
}

variable "period" {
  default = 300
}

variable "stacked" {
  default = false
}

variable "stat" {
  default = "Average"
}

variable "title" {
  default = false
}

variable "view" {
  default = "timeSeries"
}

variable "service_metric_names" {
  description = "A list of the exact names of the services to show on the dashboard"
  type        = "list"
}
