resource "aws_cloudwatch_dashboard" "eks-cluster" {
  dashboard_name = "eks-cluster"
  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "*"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "eu-central-1",
        "title": "EC2 Instance CPU"
      }
    },
    }
  ]
}
EOF
}

resource "aws_cloudwatch_metric_alarm" "ec2-cpu" {
  alarm_name                = "ec2-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
}