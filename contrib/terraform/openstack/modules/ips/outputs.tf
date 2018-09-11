output "k8s_master_fips" {
  value = ["${openstack_networking_floatingip_v2.k8s_master.*.address}"]
}

output "k8s_node_fips" {
  value = ["${openstack_networking_floatingip_v2.k8s_node.*.address}"]
}

output "k8s_node_gpu_fips" {
  value = ["${openstack_networking_floatingip_v2.k8s_node_gpu.*.address}"]
}

output "bastion_fips" {
  value = ["${openstack_networking_floatingip_v2.bastion.*.address}"]
}
