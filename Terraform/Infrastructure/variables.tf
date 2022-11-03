variable "projectName" {
   type = string
}
variable "vpcName" {
   type = string
   default = "project-vpc"
}
variable "region" {   
    type = string
    default = "us-central1" 
}
variable "managementSubnetCidr" {
   type = string
   default = "10.0.0.0/24"
}
variable "restrictedSubnetCidr" {
   type = string
   default = "10.0.1.0/24"
}

