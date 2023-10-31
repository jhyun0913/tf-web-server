variable "aws_region" {
  type        = string
  description = "AWS 리전 코드 입니다."
  default     = "ap-southeast-1"

}

variable "aws_access_key" {
  type        = string
  description = "AWS CLI ACCESS KEY 입니다."
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "AWS CLI SECRET KEY 입니다."
  sensitive   = true
}
