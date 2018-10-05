module "network" {
  source = "modules/network"

  external_net    = "${var.external_net}"
  network_name    = "${var.network_name}"
  subnet_cidr     = "${var.subnet_cidr}"
  cluster_name    = "${var.cluster_name}"
  dns_nameservers = "${var.dns_nameservers}"
}

module "ips" {
  source = "modules/ips"

  number_of_k8s_masters         = "${var.number_of_k8s_masters}"
  number_of_k8s_masters_no_etcd = "${var.number_of_k8s_masters_no_etcd}"
  number_of_k8s_nodes           = "${var.number_of_k8s_nodes}"
  number_of_k8s_nodes_gpu       = "${var.number_of_k8s_nodes_gpu}"
  floatingip_pool               = "${var.floatingip_pool}"
  number_of_bastions            = "${var.number_of_bastions}"
  external_net                  = "${var.external_net}"
  network_name                  = "${var.network_name}"
  router_id                     = "${module.network.router_id}"
}

module "compute" {
  source = "modules/compute"

  cluster_name                                 = "${var.cluster_name}"
  az_list                                      = "${var.az_list}"
  az_gpu_list                                  = "${var.az_gpu_list}"
  number_of_k8s_masters                        = "${var.number_of_k8s_masters}"
  number_of_k8s_masters_no_etcd                = "${var.number_of_k8s_masters_no_etcd}"
  number_of_etcd                               = "${var.number_of_etcd}"
  number_of_k8s_masters_no_floating_ip         = "${var.number_of_k8s_masters_no_floating_ip}"
  number_of_k8s_masters_no_floating_ip_no_etcd = "${var.number_of_k8s_masters_no_floating_ip_no_etcd}"
  number_of_k8s_nodes                          = "${var.number_of_k8s_nodes}"
  number_of_k8s_nodes_gpu                      = "${var.number_of_k8s_nodes_gpu}"
  number_of_bastions                           = "${var.number_of_bastions}"
  number_of_k8s_nodes_no_floating_ip           = "${var.number_of_k8s_nodes_no_floating_ip}"
  number_of_gfs_nodes_no_floating_ip           = "${var.number_of_gfs_nodes_no_floating_ip}"
  gfs_volume_size_in_gb                        = "${var.gfs_volume_size_in_gb}"
  public_key_path                              = "${var.public_key_path}"
  image                                        = "${var.image}"
  image                                   = "${var.image_node}"
  image_gfs                                    = "${var.image_gfs}"
  ssh_user                                     = "${var.ssh_user}"
  ssh_user_gfs                                 = "${var.ssh_user_gfs}"
  flavor_k8s_master                            = "${var.flavor_k8s_master}"
  flavor_k8s_node                              = "${var.flavor_k8s_node}"
  flavor_k8s_node_gpu                          = "${var.flavor_k8s_node_gpu}"
  flavor_etcd                                  = "${var.flavor_etcd}"
  flavor_gfs_node                              = "${var.flavor_gfs_node}"
  network_name                                 = "${var.network_name}"
  flavor_bastion                               = "${var.flavor_bastion}"
  k8s_master_fips                              = "${module.ips.k8s_master_fips}"
  k8s_node_fips                                = "${module.ips.k8s_node_fips}"
  k8s_node_gpu_fips                            = "${module.ips.k8s_node_gpu_fips}"
  bastion_fips                                 = "${module.ips.bastion_fips}"
  supplementary_master_groups                  = "${var.supplementary_master_groups}"
  supplementary_node_groups                    = "${var.supplementary_node_groups}"

  network_id = "${module.network.router_id}"
}

output "private_subnet_id" {
  value = "${module.network.subnet_id}"
}

output "floating_network_id" {
  value = "${var.external_net}"
}

output "router_id" {
  value = "${module.network.router_id}"
}

output "k8s_master_fips" {
  value = "${module.ips.k8s_master_fips}"
}

output "k8s_node_fips" {
  value = "${module.ips.k8s_node_fips}"
}

output "k8s_node_gpu_fips" {
  value = "${module.ips.k8s_node_gpu_fips}"
}

output "bastion_fips" {
  value = "${module.ips.bastion_fips}"
}
