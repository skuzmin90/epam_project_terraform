resource "aws_alb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets = [aws_subnet.public-subnet-1.id,aws_subnet.public-subnet-2.id]
  enable_cross_zone_load_balancing = true

  enable_deletion_protection = false

//  access_logs {
//    bucket  = aws_s3_bucket.lb_logs.bucket
//    prefix  = "test-lb"
//    enabled = true
//  }

  tags = {
    Environment = "production"
  }
}

resource "aws_alb_target_group" "alb-tg" {
  target_type = "instance"
  vpc_id = aws_vpc.vpc.id
  protocol = "HTTP"
  port = 80

  health_check {
    protocol = "HTTP"
    path = "/"
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
  }
}

resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.alb-tg.arn
    type             = "forward"
  }
}

resource "aws_route53_zone" "aws_route" {
  name = "skuzmin.com"
}

resource "aws_route53_record" "terraform" {
  zone_id = aws_route53_zone.aws_route.zone_id
  name    = "skuzmin.devops.com"
  type    = "A"
  alias {
    name                   = "${aws_alb.alb.dns_name}"
    zone_id                = "${aws_alb.alb.zone_id}"
    evaluate_target_health = true
  }
}
