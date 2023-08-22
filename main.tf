provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}
data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "terraform" {
  name             = "dorraa"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  folder = "Dorra Ferah"
  datastore_id     = data.vsphere_datastore.datastore.id
  
  guest_id     = "ubuntu64Guest"
  num_cpus = 2
  memory   = 5000
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3" 
  }
 
  disk {
  label = "disk"
  size  = 101
 
 // thin_provisioned = true
 
  }
 
  clone {
     template_uuid = data.vsphere_virtual_machine.template.id
   /*  customize {
      linux_options {
        host_name = "test"
        domain    = ""
      }
      network_interface {
        ipv4_address = "10.2.1.40"
        ipv4_netmask = 24
        dns_server_list = ["8.8.8.8"]  
      }
      
    ipv4_gateway = "10.2.1.254"
    }*/
  }

/* cdrom {
   datastore_id     = data.vsphere_datastore.datastore.id
    path = "ISO/ubuntu-20.04.2.0-desktop-amd64.iso"
}*/
  
}
