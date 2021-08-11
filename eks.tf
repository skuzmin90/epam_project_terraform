//resource "aws_iam_role" "eks-cluster" {
//  name = "eks-cluster"
//  assume_role_policy = <<POLICY
//{
//  "Version": "2012-10-17",
//  "Statement": [
//    {
//      "Effect": "Allow",
//      "Principal": {
//        "Service": "eks.amazonaws.com"
//      },
//      "Action": "sts:AssumeRole"
//    }
//  ]
//}
//POLICY
//}
//
//resource "aws_iam_role_policy_attachment" "eks-cluster-policy" {
//  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
//  role       = aws_iam_role.eks-cluster.name
//}
//
//resource "aws_iam_role_policy_attachment" "eks-vpc-policy" {
//  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
//  role       = aws_iam_role.eks-cluster.name
//}
//
//resource "aws_eks_cluster" "eks" {
//  name     = "eks"
//  role_arn = aws_iam_role.eks-cluster.arn
//  version  = "1.21"
//  vpc_config {
//    endpoint_private_access = false
//    endpoint_public_access  = true
//    subnet_ids = [
//      aws_subnet.private-1.id,
//      aws_subnet.private-2.id,
//      aws_subnet.public-1.id,
//      aws_subnet.public-2.id]
//  }
//  depends_on = [
//    aws_iam_role_policy_attachment.eks-cluster-policy,
//    aws_iam_role_policy_attachment.eks-vpc-policy
//  ]
//  tags = {
//    Name = "eks"
//  }
//}