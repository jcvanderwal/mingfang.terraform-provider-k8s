/**
 * Module usage:
 *
 *     module "postgres" {
 *       source             = "git::https://github.com/mingfang/terraform-provider-k8s.git//modules/postgres"
 *       name               = "test-postgres"
 *       postgres_user      = "postgres"
 *       postgres_password  = "postgres"
 *       postgres_db        = "postgres"

 *       storage_class_name = "test-postgres"
 *       storage            = "100Gi"
 *       replicas           = "${k8s_core_v1_persistent_volume.test-postgres.count}"
 *     }
 *
 *     resource "k8s_core_v1_persistent_volume" "test-postgres" {
 *       count = 1
 *
 *       metadata {
 *         name = "pvc-test-postgres-${count.index}"
 *       }
 *
 *       spec {
 *         storage_class_name               = "test-postgres"
 *         persistent_volume_reclaim_policy = "Retain"
 *
 *         access_modes = [
 *           "ReadWriteMany",
 *         ]
 *
 *         capacity {
 *           storage = "100Gi"
 *         }
 *
 *         cephfs {
 *           user = "admin"
 *
 *           monitors = [
 *             "192.168.2.89",
 *             "192.168.2.39",
 *           ]
 *
 *           secret_ref {
 *             name = "ceph-secret"
 *             namespace = "default"
 *           }
 *         }
 *       }
 *     }
 */

/*
common variables
*/

variable "name" {}

variable "namespace" {
  default = "default"
}

variable "replicas" {
  default = 1
}

variable image {
  default = "postgres:9.6"
}

variable "node_selector" {
  type    = "map"
  default = {}
}

/*
statefulset specific
*/

variable storage_class_name {}

variable storage {}

variable volume_claim_template_name {
  default = "pvc"
}

/*
service specific variables
*/

variable postgres_password {}

variable postgres_user {}

variable postgres_db {}

locals {
  labels = {
    app     = "${var.name}"
    name    = "${var.name}"
    service = "${var.name}"
  }
}

/*
service
*/

resource "k8s_core_v1_service" "this" {
  metadata {
    name      = "${var.name}"
    namespace = "${var.namespace}"
    labels    = "${local.labels}"
  }

  spec {
    selector = "${local.labels}"

    ports = [
      {
        name = "tcp"
        port = 5432
      },
    ]
  }
}

/*
statefulset
*/

resource "k8s_apps_v1_stateful_set" "this" {
  metadata {
    name      = "${var.name}"
    namespace = "${var.namespace}"
    labels    = "${local.labels}"
  }

  spec {
    replicas              = "${var.replicas}"
    service_name          = "${k8s_core_v1_service.this.metadata.0.name}"
    pod_management_policy = "OrderedReady"

    selector {
      match_labels = "${local.labels}"
    }

    update_strategy {
      type = "RollingUpdate"

      rolling_update {
        partition = 0
      }
    }

    template {
      metadata {
        labels = "${local.labels}"
      }

      spec {
        node_selector = "${var.node_selector}"

        affinity {
          pod_anti_affinity {
            required_during_scheduling_ignored_during_execution {
              label_selector {
                match_expressions {
                  key      = "app"
                  operator = "In"
                  values   = ["${var.name}"]
                }
              }

              topology_key = "kubernetes.io/hostname"
            }
          }
        }

        containers = [
          {
            name  = "postgres"
            image = "${var.image}"

            env = [
              {
                name  = "POSTGRES_PASSWORD"
                value = "${var.postgres_password}"
              },
              {
                name  = "POSTGRES_USER"
                value = "${var.postgres_user}"
              },
              {
                name  = "POSTGRES_DB"
                value = "${var.postgres_db}"
              },
              {
                name = "POD_NAME"

                value_from {
                  field_ref {
                    field_path = "metadata.name"
                  }
                }
              },
              {
                name  = "PGDATA"
                value = "/data/$(POD_NAME)"
              },
            ]

            volume_mounts {
              name       = "${var.volume_claim_template_name}"
              mount_path = "/data"
              sub_path   = "${var.name}"
            }
          },
        ]
      }
    }

    volume_claim_templates {
      metadata {
        name = "${var.volume_claim_template_name}"
      }

      spec {
        storage_class_name = "${var.storage_class_name}"
        access_modes       = ["ReadWriteOnce"]

        resources {
          requests {
            storage = "${var.storage}"
          }
        }
      }
    }
  }
}

resource "k8s_policy_v1beta1_pod_disruption_budget" "this" {
  metadata {
    name = "${var.name}"
  }

  spec {
    max_unavailable = 1

    selector {
      match_labels = "${local.labels}"
    }
  }
}

output "name" {
  value = "${k8s_core_v1_service.this.metadata.0.name}"
}
