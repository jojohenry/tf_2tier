#---/Modules/alb---

resource "aws_lb_target_group" "target-group" {
  health_check {
    interval            = var.lb_interval
    timeout             = var.lb_timeout
    healthy_threshold   = var.lb_healthy_threshold
    unhealthy_threshold = var.lb_unhealthy_threshold
  }
  name        = "${var.tag_name}-tg"
  port        = var.lb_port
  protocol    = var.lb_protocol
  vpc_id      = var.vpc_id
}

resource "aws_lb" "application-lb" {
  name               = "${var.tag_name}-alb"
  enable_deletion_protection = false
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group]
  subnets            = var.subnet_ids

  tags = {
    Environment = "${var.tag_name}-alb"
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.application-lb.arn
  port              = var.lb_port
  protocol          = var.lb_protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}



resource "aws_lb_target_group_attachment" "ec2_attach" {
  count            = length(var.aws_instance)
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = var.aws_instance[count.index].id
}