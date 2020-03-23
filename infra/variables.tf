variable "region" {
  default = "us-east-1"
}
variable "eks_cluster_name" {
  default = "terraform-eks-poc"
  type    = string
}
variable "instance_type" {
  default = "t2.micro"
}
variable "workers_additional_policies" {
  default = []
}