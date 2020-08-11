
# resource "k8s_apiextensions_k8s_io_v1beta1_custom_resource_definition"

CustomResourceDefinition represents a resource that should be exposed on the API server.  Its name MUST be in the format <.spec.name>.<.spec.group>. Deprecated in v1.16, planned for removal in v1.19. Use apiextensions.k8s.io/v1 CustomResourceDefinition instead.

  
<details>
<summary>metadata</summary><blockquote>

    
- [annotations](#annotations)
- [creation_timestamp](#creation_timestamp)
- [deletion_grace_period_seconds](#deletion_grace_period_seconds)
- [deletion_timestamp](#deletion_timestamp)
- [labels](#labels)
- [name](#name)
- [namespace](#namespace)
- [resource_version](#resource_version)
- [self_link](#self_link)
- [uid](#uid)

    
</details>

<details>
<summary>spec</summary><blockquote>

    
- [group](#group)*
- [preserve_unknown_fields](#preserve_unknown_fields)
- [scope](#scope)*
- [version](#version)

    
<details>
<summary>additional_printer_columns</summary><blockquote>

    
- [description](#description)
- [format](#format)
- [json_path](#json_path)*
- [name](#name)*
- [priority](#priority)
- [type](#type)*

    
</details>

<details>
<summary>conversion</summary><blockquote>

    
- [conversion_review_versions](#conversion_review_versions)
- [strategy](#strategy)*

    
<details>
<summary>webhook_client_config</summary><blockquote>

    
- [cabundle](#cabundle)
- [url](#url)

    
<details>
<summary>service</summary><blockquote>

    
- [name](#name)*
- [namespace](#namespace)*
- [path](#path)
- [port](#port)

    
</details>

</details>

</details>

<details>
<summary>names</summary><blockquote>

    
- [categories](#categories)
- [kind](#kind)*
- [list_kind](#list_kind)
- [plural](#plural)*
- [short_names](#short_names)
- [singular](#singular)

    
</details>

<details>
<summary>subresources</summary><blockquote>

    
- [status](#status)

    
<details>
<summary>scale</summary><blockquote>

    
- [label_selector_path](#label_selector_path)
- [spec_replicas_path](#spec_replicas_path)*
- [status_replicas_path](#status_replicas_path)*

    
</details>

</details>

<details>
<summary>validation</summary><blockquote>

    
- [open_apiv3_schema](#open_apiv3_schema)

    
</details>

<details>
<summary>versions</summary><blockquote>

    
- [name](#name)*
- [served](#served)*
- [storage](#storage)*

    
<details>
<summary>additional_printer_columns</summary><blockquote>

    
- [description](#description)
- [format](#format)
- [json_path](#json_path)*
- [name](#name)*
- [priority](#priority)
- [type](#type)*

    
</details>

<details>
<summary>schema</summary><blockquote>

    
- [open_apiv3_schema](#open_apiv3_schema)

    
</details>

<details>
<summary>subresources</summary><blockquote>

    
- [status](#status)

    
<details>
<summary>scale</summary><blockquote>

    
- [label_selector_path](#label_selector_path)
- [spec_replicas_path](#spec_replicas_path)*
- [status_replicas_path](#status_replicas_path)*

    
</details>

</details>

</details>

</details>


<details>
<summary>example</summary><blockquote>

```hcl
resource "k8s_apiextensions_k8s_io_v1beta1_custom_resource_definition" "this" {

  metadata {
    annotations = { "key" = "TypeString" }
    labels      = { "key" = "TypeString" }
    name        = "TypeString"
    namespace   = "TypeString"
  }

  spec {

    additional_printer_columns {
      description = "TypeString"
      format      = "TypeString"
      json_path   = "TypeString*"
      name        = "TypeString*"
      priority    = "TypeInt"
      type        = "TypeString*"
    }

    conversion {
      conversion_review_versions = ["TypeString"]
      strategy                   = "TypeString*"

      webhook_client_config {
        cabundle = "TypeString"

        service {
          name      = "TypeString*"
          namespace = "TypeString*"
          path      = "TypeString"
          port      = "TypeInt"
        }
        url = "TypeString"
      }
    }
    group = "TypeString*"

    names {
      categories  = ["TypeString"]
      kind        = "TypeString*"
      list_kind   = "TypeString"
      plural      = "TypeString*"
      short_names = ["TypeString"]
      singular    = "TypeString"
    }
    preserve_unknown_fields = "TypeString"
    scope                   = "TypeString*"

    subresources {

      scale {
        label_selector_path  = "TypeString"
        spec_replicas_path   = "TypeString*"
        status_replicas_path = "TypeString*"
      }
      status = { "key" = "TypeString" }
    }

    validation {
      open_apiv3_schema = "TypeString"
    }
    version = "TypeString"

    versions {

      additional_printer_columns {
        description = "TypeString"
        format      = "TypeString"
        json_path   = "TypeString*"
        name        = "TypeString*"
        priority    = "TypeInt"
        type        = "TypeString*"
      }
      name = "TypeString*"

      schema {
        open_apiv3_schema = "TypeString"
      }
      served  = "TypeString*"
      storage = "TypeString*"

      subresources {

        scale {
          label_selector_path  = "TypeString"
          spec_replicas_path   = "TypeString*"
          status_replicas_path = "TypeString*"
        }
        status = { "key" = "TypeString" }
      }
    }
  }
}


```

</details>

  
## metadata



    
#### annotations

######  TypeMap

Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. More info: http://kubernetes.io/docs/user-guide/annotations
#### creation_timestamp

######  ReadOnly • TypeString

CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC.

Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
#### deletion_grace_period_seconds

######  ReadOnly • TypeInt

Number of seconds allowed for this object to gracefully terminate before it will be removed from the system. Only set when deletionTimestamp is also set. May only be shortened. Read-only.
#### deletion_timestamp

######  ReadOnly • TypeString

DeletionTimestamp is RFC 3339 date and time at which this resource will be deleted. This field is set by the server when a graceful deletion is requested by the user, and is not directly settable by a client. The resource is expected to be deleted (no longer visible from resource lists, and not reachable by name) after the time in this field, once the finalizers list is empty. As long as the finalizers list contains items, deletion is blocked. Once the deletionTimestamp is set, this value may not be unset or be set further into the future, although it may be shortened or the resource may be deleted prior to this time. For example, a user may request that a pod is deleted in 30 seconds. The Kubelet will react by sending a graceful termination signal to the containers in the pod. After that 30 seconds, the Kubelet will send a hard termination signal (SIGKILL) to the container and after cleanup, remove the pod from the API. In the presence of network partitions, this object may still exist after this timestamp, until an administrator or automated process can determine the resource is fully terminated. If not set, graceful deletion of the object has not been requested.

Populated by the system when a graceful deletion is requested. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
#### labels

######  TypeMap

Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels
#### name

######  TypeString

Name must be unique within a namespace. Is required when creating resources, although some resources may allow a client to request the generation of an appropriate name automatically. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names
#### namespace

######  TypeString

Namespace defines the space within each name must be unique. An empty namespace is equivalent to the "default" namespace, but "default" is the canonical representation. Not all objects are required to be scoped to a namespace - the value of this field for those objects will be empty.

Must be a DNS_LABEL. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/namespaces
#### resource_version

######  ReadOnly • TypeString

An opaque value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server. They may only be valid for a particular resource or set of resources.

Populated by the system. Read-only. Value must be treated as opaque by clients and . More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
#### self_link

######  ReadOnly • TypeString

SelfLink is a URL representing this object. Populated by the system. Read-only.

DEPRECATED Kubernetes will stop propagating this field in 1.20 release and the field is planned to be removed in 1.21 release.
#### uid

######  ReadOnly • TypeString

UID is the unique in time and space value for this object. It is typically generated by the server on successful creation of a resource and is not allowed to change on PUT operations.

Populated by the system. Read-only. More info: http://kubernetes.io/docs/user-guide/identifiers#uids
## spec

spec describes how the user wants the resources to appear

    
## additional_printer_columns

additionalPrinterColumns specifies additional columns returned in Table output. See https://kubernetes.io/docs/reference/using-api/api-concepts/#receiving-resources-as-tables for details. If present, this field configures columns for all versions. Top-level and per-version columns are mutually exclusive. If no top-level or per-version columns are specified, a single column displaying the age of the custom resource is used.

    
#### description

######  TypeString

description is a human readable description of this column.
#### format

######  TypeString

format is an optional OpenAPI type definition for this column. The 'name' format is applied to the primary identifier column to assist in clients identifying column is the resource name. See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
#### json_path

###### Required •  TypeString

JSONPath is a simple JSON path (i.e. with array notation) which is evaluated against each custom resource to produce the value for this column.
#### name

###### Required •  TypeString

name is a human readable name for the column.
#### priority

######  TypeInt

priority is an integer defining the relative importance of this column compared to others. Lower numbers are considered higher priority. Columns that may be omitted in limited space scenarios should be given a priority greater than 0.
#### type

###### Required •  TypeString

type is an OpenAPI type definition for this column. See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
## conversion

conversion defines conversion settings for the CRD.

    
#### conversion_review_versions

######  TypeList

conversionReviewVersions is an ordered list of preferred `ConversionReview` versions the Webhook expects. The API server will use the first version in the list which it supports. If none of the versions specified in this list are supported by API server, conversion will fail for the custom resource. If a persisted Webhook configuration specifies allowed versions and does not include any versions known to the API Server, calls to the webhook will fail. Defaults to `["v1beta1"]`.
#### strategy

###### Required •  TypeString

strategy specifies how custom resources are converted between versions. Allowed values are: - `None`: The converter only change the apiVersion and would not touch any other field in the custom resource. - `Webhook`: API Server will call to an external webhook to do the conversion. Additional information
  is needed for this option. This requires spec.preserveUnknownFields to be false, and spec.conversion.webhookClientConfig to be set.
## webhook_client_config

webhookClientConfig is the instructions for how to call the webhook if strategy is `Webhook`. Required when `strategy` is set to `Webhook`.

    
#### cabundle

######  TypeString

caBundle is a PEM encoded CA bundle which will be used to validate the webhook's server certificate. If unspecified, system trust roots on the apiserver are used.
## service

service is a reference to the service for this webhook. Either service or url must be specified.

If the webhook is running within the cluster, then you should use `service`.

    
#### name

###### Required •  TypeString

name is the name of the service. Required
#### namespace

###### Required •  TypeString

namespace is the namespace of the service. Required
#### path

######  TypeString

path is an optional URL path at which the webhook will be contacted.
#### port

######  TypeInt

port is an optional service port at which the webhook will be contacted. `port` should be a valid port number (1-65535, inclusive). Defaults to 443 for backward compatibility.
#### url

######  TypeString

url gives the location of the webhook, in standard URL form (`scheme://host:port/path`). Exactly one of `url` or `service` must be specified.

The `host` should not refer to a service running in the cluster; use the `service` field instead. The host might be resolved via external DNS in some apiservers (e.g., `kube-apiserver` cannot resolve in-cluster DNS as that would be a layering violation). `host` may also be an IP address.

Please note that using `localhost` or `127.0.0.1` as a `host` is risky unless you take great care to run this webhook on all hosts which run an apiserver which might need to make calls to this webhook. Such installs are likely to be non-portable, i.e., not easy to turn up in a new cluster.

The scheme must be "https"; the URL must begin with "https://".

A path is optional, and if present may be any string permissible in a URL. You may use the path to pass an arbitrary string to the webhook, for example, a cluster identifier.

Attempting to use a user or basic auth e.g. "user:password@" is not allowed. Fragments ("#...") and query parameters ("?...") are not allowed, either.
#### group

###### Required •  TypeString

group is the API group of the defined custom resource. The custom resources are served under `/apis/<group>/...`. Must match the name of the CustomResourceDefinition (in the form `<names.plural>.<group>`).
## names

names specify the resource and kind names for the custom resource.

    
#### categories

######  TypeList

categories is a list of grouped resources this custom resource belongs to (e.g. 'all'). This is published in API discovery documents, and used by clients to support invocations like `kubectl get all`.
#### kind

###### Required •  TypeString

kind is the serialized kind of the resource. It is normally CamelCase and singular. Custom resource instances will use this value as the `kind` attribute in API calls.
#### list_kind

######  TypeString

listKind is the serialized kind of the list for this resource. Defaults to "`kind`List".
#### plural

###### Required •  TypeString

plural is the plural name of the resource to serve. The custom resources are served under `/apis/<group>/<version>/.../<plural>`. Must match the name of the CustomResourceDefinition (in the form `<names.plural>.<group>`). Must be all lowercase.
#### short_names

######  TypeList

shortNames are short names for the resource, exposed in API discovery documents, and used by clients to support invocations like `kubectl get <shortname>`. It must be all lowercase.
#### singular

######  TypeString

singular is the singular name of the resource. It must be all lowercase. Defaults to lowercased `kind`.
#### preserve_unknown_fields

######  TypeString

preserveUnknownFields indicates that object fields which are not specified in the OpenAPI schema should be preserved when persisting to storage. apiVersion, kind, metadata and known fields inside metadata are always preserved. If false, schemas must be defined for all versions. Defaults to true in v1beta for backwards compatibility. Deprecated: will be required to be false in v1. Preservation of unknown fields can be specified in the validation schema using the `x-kubernetes-preserve-unknown-fields: true` extension. See https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/#pruning-versus-preserving-unknown-fields for details.
#### scope

###### Required •  TypeString

scope indicates whether the defined custom resource is cluster- or namespace-scoped. Allowed values are `Cluster` and `Namespaced`. Default is `Namespaced`.
## subresources

subresources specify what subresources the defined custom resource has. If present, this field configures subresources for all versions. Top-level and per-version subresources are mutually exclusive.

    
## scale

scale indicates the custom resource should serve a `/scale` subresource that returns an `autoscaling/v1` Scale object.

    
#### label_selector_path

######  TypeString

labelSelectorPath defines the JSON path inside of a custom resource that corresponds to Scale `status.selector`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.status` or `.spec`. Must be set to work with HorizontalPodAutoscaler. The field pointed by this JSON path must be a string field (not a complex selector struct) which contains a serialized label selector in string form. More info: https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions#scale-subresource If there is no value under the given path in the custom resource, the `status.selector` value in the `/scale` subresource will default to the empty string.
#### spec_replicas_path

###### Required •  TypeString

specReplicasPath defines the JSON path inside of a custom resource that corresponds to Scale `spec.replicas`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.spec`. If there is no value under the given path in the custom resource, the `/scale` subresource will return an error on GET.
#### status_replicas_path

###### Required •  TypeString

statusReplicasPath defines the JSON path inside of a custom resource that corresponds to Scale `status.replicas`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.status`. If there is no value under the given path in the custom resource, the `status.replicas` value in the `/scale` subresource will default to 0.
#### status

######  TypeMap

status indicates the custom resource should serve a `/status` subresource. When enabled: 1. requests to the custom resource primary endpoint ignore changes to the `status` stanza of the object. 2. requests to the custom resource `/status` subresource ignore changes to anything other than the `status` stanza of the object.
## validation

validation describes the schema used for validation and pruning of the custom resource. If present, this validation schema is used to validate all versions. Top-level and per-version schemas are mutually exclusive.

    
#### open_apiv3_schema

######  TypeString

openAPIV3Schema is the OpenAPI v3 schema to use for validation and pruning.
#### version

######  TypeString

version is the API version of the defined custom resource. The custom resources are served under `/apis/<group>/<version>/...`. Must match the name of the first item in the `versions` list if `version` and `versions` are both specified. Optional if `versions` is specified. Deprecated: use `versions` instead.
## versions

versions is the list of all API versions of the defined custom resource. Optional if `version` is specified. The name of the first item in the `versions` list must match the `version` field if `version` and `versions` are both specified. Version names are used to compute the order in which served versions are listed in API discovery. If the version string is "kube-like", it will sort above non "kube-like" version strings, which are ordered lexicographically. "Kube-like" versions start with a "v", then are followed by a number (the major version), then optionally the string "alpha" or "beta" and another number (the minor version). These are sorted first by GA > beta > alpha (where GA is a version with no suffix such as beta or alpha), and then by comparing major version, then minor version. An example sorted list of versions: v10, v2, v1, v11beta2, v10beta3, v3beta1, v12alpha1, v11alpha2, foo1, foo10.

    
## additional_printer_columns

additionalPrinterColumns specifies additional columns returned in Table output. See https://kubernetes.io/docs/reference/using-api/api-concepts/#receiving-resources-as-tables for details. Top-level and per-version columns are mutually exclusive. Per-version columns must not all be set to identical values (top-level columns should be used instead). If no top-level or per-version columns are specified, a single column displaying the age of the custom resource is used.

    
#### description

######  TypeString

description is a human readable description of this column.
#### format

######  TypeString

format is an optional OpenAPI type definition for this column. The 'name' format is applied to the primary identifier column to assist in clients identifying column is the resource name. See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
#### json_path

###### Required •  TypeString

JSONPath is a simple JSON path (i.e. with array notation) which is evaluated against each custom resource to produce the value for this column.
#### name

###### Required •  TypeString

name is a human readable name for the column.
#### priority

######  TypeInt

priority is an integer defining the relative importance of this column compared to others. Lower numbers are considered higher priority. Columns that may be omitted in limited space scenarios should be given a priority greater than 0.
#### type

###### Required •  TypeString

type is an OpenAPI type definition for this column. See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
#### name

###### Required •  TypeString

name is the version name, e.g. “v1”, “v2beta1”, etc. The custom resources are served under this version at `/apis/<group>/<version>/...` if `served` is true.
## schema

schema describes the schema used for validation and pruning of this version of the custom resource. Top-level and per-version schemas are mutually exclusive. Per-version schemas must not all be set to identical values (top-level validation schema should be used instead).

    
#### open_apiv3_schema

######  TypeString

openAPIV3Schema is the OpenAPI v3 schema to use for validation and pruning.
#### served

###### Required •  TypeString

served is a flag enabling/disabling this version from being served via REST APIs
#### storage

###### Required •  TypeString

storage indicates this version should be used when persisting custom resources to storage. There must be exactly one version with storage=true.
## subresources

subresources specify what subresources this version of the defined custom resource have. Top-level and per-version subresources are mutually exclusive. Per-version subresources must not all be set to identical values (top-level subresources should be used instead).

    
## scale

scale indicates the custom resource should serve a `/scale` subresource that returns an `autoscaling/v1` Scale object.

    
#### label_selector_path

######  TypeString

labelSelectorPath defines the JSON path inside of a custom resource that corresponds to Scale `status.selector`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.status` or `.spec`. Must be set to work with HorizontalPodAutoscaler. The field pointed by this JSON path must be a string field (not a complex selector struct) which contains a serialized label selector in string form. More info: https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions#scale-subresource If there is no value under the given path in the custom resource, the `status.selector` value in the `/scale` subresource will default to the empty string.
#### spec_replicas_path

###### Required •  TypeString

specReplicasPath defines the JSON path inside of a custom resource that corresponds to Scale `spec.replicas`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.spec`. If there is no value under the given path in the custom resource, the `/scale` subresource will return an error on GET.
#### status_replicas_path

###### Required •  TypeString

statusReplicasPath defines the JSON path inside of a custom resource that corresponds to Scale `status.replicas`. Only JSON paths without the array notation are allowed. Must be a JSON Path under `.status`. If there is no value under the given path in the custom resource, the `status.replicas` value in the `/scale` subresource will default to 0.
#### status

######  TypeMap

status indicates the custom resource should serve a `/status` subresource. When enabled: 1. requests to the custom resource primary endpoint ignore changes to the `status` stanza of the object. 2. requests to the custom resource `/status` subresource ignore changes to anything other than the `status` stanza of the object.