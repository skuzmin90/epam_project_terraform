resource "aws_ecr_repository" "github-actions" {
  name                 = "github-actions"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "github-actions"
  }
}