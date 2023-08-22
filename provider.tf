terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.1.1"
    }
 /*   backend "vsphere" {
    disable_checkpoint = true
  }*/
  }
  
}
