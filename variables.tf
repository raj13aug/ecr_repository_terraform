variable "docker_image_tag" {
  type        = string
  description = "This is the tag which will be used for the image that you created"
  default     = "latest"
}

variable "immutable_ecr_repositories" {
  type = bool
}

variable "region" {
  default = "eu-west-2"
}