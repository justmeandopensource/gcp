variable "project"          { description = "Google Cloud Project" }
variable "region"           { description = "Google Cloud Region" }
variable "zone"             { description = "Google cloud Zone" }
variable "machine_type"     { description = "Machine type" }
variable "machine_image"    { description = "Machine Image" }
variable "disk_size"        { description = "Size of disk in GB" }
variable "network"          { description = "VPC" }
variable "subnetwork"       { description = "VPC Subnet" }

locals {
  my_public_ip = "${chomp(data.http.my_public_ip.body)}/32"
}