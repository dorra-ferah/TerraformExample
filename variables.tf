variable "vsphere_server" {
  default = "vc-vstack-017-lab.virtualstack.tn"
  type    = string
}

variable "vsphere_user" {
  default = "DFH"
  type    = string
}

variable "vsphere_password" {
  default   = "H5fxw@A@68"
  type      = string
  sensitive = true
}

variable "datacenter" {
  default = "DTX1"
  type    = string
}

variable "cluster" {
  default = "Clu001-UCS02-PRD"
  type    = string
}

variable "datastore" {
  default = "ds001-lab-ucs02-svc1-stor3-dtx1"
  type    = string
}

variable "network_name" {
  default = "VLAN_LAB"
  type    = string
}
variable "template" {
  description = "IP or DNS name to connect to vCenter server"
  type        = string
  default     = "rayubuntu"
}
