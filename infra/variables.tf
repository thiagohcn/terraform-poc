variable "region" {
  default = "us-east-1"
}
variable "eks_cluster_name" {
  default = "terraform-eks-poc"
  type    = string
}