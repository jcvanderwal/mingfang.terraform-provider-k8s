/**
 * Create a set of PersistentVolumes and a coresponding set of PersistentVolumeClaims.
 *
 * Useful for used with the VolumeClaimTemplates of StatefulSets.
 *
 */

variable "name" {}
variable "count" {}
variable "nfs_server" {}
variable "storage" {}

variable "annotations" {
  type    = "map"
  default = {}
}

output storage_class_name {
  value = "${element(k8s_core_v1_persistent_volume_claim.this.*.spec.0.storage_class_name, 0)}"
}

output storage {
  value = "${element(k8s_core_v1_persistent_volume_claim.this.*.spec.0.resources.0.requests.storage, 0)}"
}

output count {
  value = "${k8s_core_v1_persistent_volume_claim.this.count}"
}