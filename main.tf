terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# # Create a VPC
# module "vpc" {
#   source       = "./aws_vpc/"
#   cidr_network = "192.168.0.0/16"
# }

# module "subnet" {
#   source     = "./aws_subnet/"
#   cidr_block = "192.168.0.0/24"
#   vpc_id     = module.vpc.vpc_id
# }

# module "keypair" {
#   source = "./aws_keypair/"
#   public_key = ""
# }

# # Create a Private Subnet
# resource "aws_subnet" "terra_private_subnet" {
#   count      = 2
#   vpc_id     = aws_vpc.terra_vpc.id
#   cidr_block = "10.0.${count.index + 2}.0/24"
#   # 짝수 번호는 가용영역 a 로 홀수 번호는 가용영역 b 로 설정
#   availability_zone       = "${var.aws_region}${count.index % 2 == 0 ? "a" : "b"}"
#   map_public_ip_on_launch = false
#   tags = {
#     Name      = "terra_private_subnet${count.index + 1}"
#     createdBy = "terraform"
#   }
# }

# # public Subnet 에 인스턴스를 생성해 주세요.
# resource "aws_instance" "terra_instance" {
#   for_each          = tomap({ "1" = "${var.aws_region}a", "2" = "${var.aws_region}b" })
#   instance_type     = "t3.micro"
#   availability_zone = each.value
#   ami               = "ami-01a2cb0405fa1877b"
#   subnet_id         = aws_subnet.terra_public_subnet[tonumber(each.key) - 1].id
#   tags = {
#     Name      = "terra_instance_${each.value}_${each.key}"
#     createdBy = "terraform"
#   }
# }