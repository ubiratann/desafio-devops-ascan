resource "aws_ecr_repository" "repository" {
  name                 = var.ecr_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "policy" {
  repository = aws_ecr_repository.repository.id

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "Policies for ${aws_ecr_repository.repository.name}",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:*"
            ]
        }
    ]
}
EOF
}
