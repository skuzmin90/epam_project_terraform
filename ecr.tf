resource "aws_iam_user" "ecr" {
  name = "ecr"
  path = "/serviceaccounts/"
}

resource "aws_iam_access_key" "ecr" {
  user = aws_iam_user.ecr.name
}

resource "aws_ecr_repository" "github_actions" {
  name                 = "github_actions"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "github-actions"
  }
}

resource "aws_iam_role" "ecr_role" {
  name = "ecr_role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AuthToken",
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AllowECR",
            "Effect": "Allow",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload"
            ],
            "Resource": "*"
        }
    ]
})
  tags = {
    tag-key = "ecr_role"
  }
  depends_on = [aws_ecr_repository.github_actions]
}