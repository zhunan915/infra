
resource "aws_iam_role" "vpc_creator_role" {
  name = "VpcCreatorRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::781942218065:role/LabRole"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  description = "Role for creating VPCs, trusted by LabRole"
}

resource "aws_iam_role_policy" "vpc_creator_policy" {
  role = aws_iam_role.vpc_creator_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateVpc",
          "ec2:CreateSubnet",
          "ec2:CreateInternetGateway",
          "ec2:CreateRouteTable",
          "ec2:AssociateRouteTable",
          "ec2:CreateSecurityGroup",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:CreateTags"
        ]
        Resource = "*"
      }
    ]
  })
}
