variable "project_tags" {
  type = map(string)
  default = {
    Name       = "terraform-github"
    Owner      = "Johans Mascardo"
    Purpose    = "Dev"
    CostCenter = "0001"
  }
}

variable "name" {
  description = "Name of EC2 instance"
  default     = "johansterraformp2"
}

variable "security_group_use_name_prefix" {
  type        = bool
  default     = false
  description = "Whether to create a default Security Group with unique name beginning with the normalized prefix."
}

variable "ami" {
  description = "Amazon Machine Image"
  default = "ami-0c02fb55956c7d316"
  type = string
}


variable "instance_count" {
  default = "1"
  type        = number
}

variable "user_data_base64" {
  type        = string
  description = "Can be used instead of `user_data` to pass base64-encoded binary data directly. Use this instead of `user_data` whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption"
  default     = null
}

variable "security_groups" {
  description = "A list of Security Group IDs to associate with EC2 instance."
  type        = list(string)
  default     = [""]
}



