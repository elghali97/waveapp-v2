resource "aws_iam_instance_profile" "app" {
  name = "fr-role-${local.tags["wavestone:project"]}-${var.environment}"
  role = aws_iam_role.container_webapp_instance_role.name
}

resource "aws_iam_role" "container_webapp_instance_role" {
  name               = "fr-role-${local.tags["wavestone:project"]}-${var.environment}"
  description        = "IAM role for ${local.tags["wavestone:project"]}-${var.environment}"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "ec2.amazonaws.com"
          },
          "Effect" : "Allow",
          "Sid" : ""
        }
      ]
    }
  )

  tags = merge(local.tags,{"Name"="fr-role-${local.tags["wavestone:project"]}-${var.environment}"})
}

resource "aws_iam_role_policy_attachment" "ssmcore"{
  role       = aws_iam_role.container_webapp_instance_role.name
  policy_arn = data.aws_iam_policy.ssmcore.arn
}

resource "aws_iam_policy" "container_webapp_s3_policy" {
  name = "container_webapp_policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:ListBucket"
        ],
        "Resource" : [
          aws_s3_bucket.container_webapp_bucket.arn
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:DeleteObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject"
        ],
        "Resource" : [
          format("%s/*", aws_s3_bucket.container_webapp_bucket.arn)
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "container_webapp_s3_policy_attachment"{
  role       = aws_iam_role.container_webapp_instance_role.name
  policy_arn = aws_iam_policy.container_webapp_s3_policy.arn
}