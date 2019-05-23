

variable "vpc_cidr_block" {
    type = "string"
    
}

variable "vpc_name" {
    type = "string"
    
}

variable "vpc_owner" {
    type = "string"
    
}

variable "remote_management_cidrs" {
    type = "list"
    
}

// https://www.terraform.io/docs/providers/aws/r/db_instance.html
variable "owner_name" {
    default = ""
}