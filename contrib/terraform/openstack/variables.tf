variable "cluster_name" {
  default = "prod"
}

variable "az_list" {
  description = "List of Availability Zones available in your OpenStack cluster"
  type = "list"
  default = ["nova"]
}

variable "number_of_bastions" {
  default = 0
}

variable "number_of_k8s_masters" {
  default = 3
}

variable "number_of_k8s_masters_no_etcd" {
  default = 0
}

variable "number_of_etcd" {
  default = 0
}

variable "number_of_k8s_masters_no_floating_ip" {
  default = 0
}

variable "number_of_k8s_masters_no_floating_ip_no_etcd" {
  default = 0
}

variable "number_of_k8s_nodes" {
  default = 6
}

variable "number_of_k8s_nodes_no_floating_ip" {
  default = 0
}

variable "number_of_gfs_nodes_no_floating_ip" {
  default = 0
}

variable "gfs_volume_size_in_gb" {
  default = 75
}

variable "public_key_path" {
  description = "The path of the ssh pub key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "image" {
  description = "the image to use"
  default     = "Test-centos7"
}

variable "image_gfs" {
  description = "Glance image to use for GlusterFS"
  default     = "CentOS-7"
}

variable "ssh_user" {
  description = "used to fill out tags for ansible inventory"
  default     = "centos"
}

variable "ssh_user_gfs" {
  description = "used to fill out tags for ansible inventory"
  default     = "centos"
}

variable "flavor_bastion" {
  description = "Use 'nova flavor-list' command to see what your OpenStack instance uses for IDs"
  default     = 3
}

variable "flavor_k8s_master" {
  description = "Use 'nova flavor-list' command to see what your OpenStack instance uses for IDs"
  default     =  "3c9e263f-59d7-4989-b349-e03ff9bc7340"
}

variable "flavor_k8s_node" {
  description = "Use 'nova flavor-list' command to see what your OpenStack instance uses for IDs"
  default     = "997927fa-0d04-4153-b8c2-8c6765888aca"
}

variable "flavor_etcd" {
  description = "Use 'nova flavor-list' command to see what your OpenStack instance uses for IDs"
  default     = "e6455fea-0816-4b8a-9158-e401a09ea070"
}

variable "flavor_gfs_node" {
  description = "Use 'nova flavor-list' command to see what your OpenStack instance uses for IDs"
  default     = 3
}

variable "network_name" {
  description = "name of the internal network to use"
  default     = "k8s-internal"
}

variable "subnet_cidr" {
  description = "Subnet CIDR block."
  type = "string"
  default = "10.0.0.0/24"
}

variable "dns_nameservers" {
  description = "An array of DNS name server names used by hosts in this subnet."
  type        = "list"
  default     = ["8.8.8.8","8.8.4.4"]
}

variable "floatingip_pool" {
  description = "name of the floating ip pool to use"
  default     = "public"
}

variable "external_net" {
  description = "uuid of the external/public network"
  default     = "58e36047-c34f-4e77-9b06-fa244cf2acb4"
}

variable "supplementary_master_groups" {
  description = "supplementary kubespray ansible groups for masters, such kube-node"
  default = ""
}

variable "supplementary_node_groups" {
  description = "supplementary kubespray ansible groups for worker nodes, such as kube-ingress"
  default = ""
}
