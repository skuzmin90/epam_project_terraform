resource "aws_alb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets = [aws_subnet.public-subnet-1.id,aws_subnet.public-subnet-2.id]

  enable_deletion_protection = true

//  access_logs {
//    bucket  = aws_s3_bucket.lb_logs.bucket
//    prefix  = "test-lb"
//    enabled = true
//  }

  tags = {
    Environment = "production"
  }
}