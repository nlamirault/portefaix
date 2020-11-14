# Copyright (C) 2020 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name                     = var.vpc_name
  cidr                     = var.vpc_subnet_cidr
  azs                      = data.aws_availability_zones.available.names
  private_subnets          = var.private_subnet_cidr
  public_subnets           = var.public_subnet_cidr
  enable_nat_gateway       = true
  single_nat_gateway       = true
  enable_dns_hostnames     = true
  enable_s3_endpoint       = true
  enable_dynamodb_endpoint = true

  tags = merge({
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared",
  }, var.vpc_tags)

  public_subnet_tags = merge({
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
  }, var.public_subnet_tags)

  private_subnet_tags = merge({
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"               = "1"
  }, var.private_subnet_tags)

}