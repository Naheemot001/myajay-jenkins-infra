# 1. Define the Trust Policy (Allows EC2 instances to assume this role)
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# 2. Create the IAM Role
resource "aws_iam_role" "jenkins_admin_role" {
  name               = "Jenkins-Terraform-Admin-Role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Environment = "DevOps"
    ManagedBy   = "Terraform"
  }
}

# 3. Attach the AdministratorAccess Policy to the Role
# (Note: For production, you may want to restrict this to specific permissions)
resource "aws_iam_role_policy_attachment" "admin_attach" {
  role       = aws_iam_role.jenkins_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# 4. Create the Instance Profile (Required to attach the role to an EC2 instance)
resource "aws_iam_instance_profile" "jenkins_profile" {
  name = "Jenkins-Terraform-Admin-Profile"
  role = aws_iam_role.jenkins_admin_role.name
}

# 5. Optional: Output the name so you know what to attach to your EC2 instance
output "instance_profile_name" {
  value       = aws_iam_instance_profile.jenkins_profile.name
  description = "Attach this instance profile to your Jenkins EC2 server"
}
