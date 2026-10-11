variable "flink_materialized_tables" {
  description = <<EOT
Map of flink_materialized_tables, attributes below
Required:
    - display_name
    - kafka_cluster (block):
        - id (required)
Optional:
    - query
    - rest_endpoint
    - session_options
    - stopped
    - table_options
    - columns (block):
        - columns_computed (optional, block):
            - column_computed_comment (optional)
            - column_computed_expression (optional)
            - column_computed_kind (optional)
            - column_computed_name (optional)
            - column_computed_type (optional)
            - column_computed_virtual (optional)
        - columns_metadata (optional, block):
            - column_metadata_comment (optional)
            - column_metadata_key (optional)
            - column_metadata_kind (optional)
            - column_metadata_name (optional)
            - column_metadata_type (optional)
            - column_metadata_virtual (optional)
        - columns_physical (optional, block):
            - column_physical_comment (optional)
            - column_physical_kind (optional)
            - column_physical_name (optional)
            - column_physical_type (optional)
    - compute_pool (block):
        - id (required)
    - constraints (block):
        - columns (optional)
        - enforced (optional)
        - name (optional)
        - type (optional)
    - credentials (block):
        - key (required)
        - secret (required)
    - distribution (block):
        - bucket_count (optional)
        - keys (optional)
        - kind (required)
    - environment (block):
        - id (required)
    - organization (block):
        - id (required)
    - principal (block):
        - id (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - watermark (block):
        - column (optional)
        - expression (optional)
EOT

  type = map(object({
    display_name    = string
    query           = optional(string)
    rest_endpoint   = optional(string)
    session_options = optional(map(string))
    stopped         = optional(bool)
    table_options   = optional(map(string))
    kafka_cluster = object({
      id = string
    })
    columns = optional(list(object({
      columns_computed = optional(list(object({
        column_computed_comment    = optional(string)
        column_computed_expression = optional(string)
        column_computed_kind       = optional(string)
        column_computed_name       = optional(string)
        column_computed_type       = optional(string)
        column_computed_virtual    = optional(bool)
      })))
      columns_metadata = optional(list(object({
        column_metadata_comment = optional(string)
        column_metadata_key     = optional(string)
        column_metadata_kind    = optional(string)
        column_metadata_name    = optional(string)
        column_metadata_type    = optional(string)
        column_metadata_virtual = optional(bool)
      })))
      columns_physical = optional(list(object({
        column_physical_comment = optional(string)
        column_physical_kind    = optional(string)
        column_physical_name    = optional(string)
        column_physical_type    = optional(string)
      })))
    })))
    compute_pool = optional(object({
      id = string
    }))
    constraints = optional(list(object({
      columns  = optional(set(string))
      enforced = optional(bool)
      name     = optional(string)
      type     = optional(string)
    })))
    credentials = optional(object({
      key    = string
      secret = string
    }))
    distribution = optional(object({
      bucket_count = optional(number)
      keys         = optional(set(string))
      kind         = string
    }))
    environment = optional(object({
      id = string
    }))
    organization = optional(object({
      id = string
    }))
    principal = optional(object({
      id = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    watermark = optional(object({
      column     = optional(string)
      expression = optional(string)
    }))
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

