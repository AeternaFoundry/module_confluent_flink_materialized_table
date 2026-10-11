resource "confluent_flink_materialized_table" "flink_materialized_tables" {
  for_each = var.flink_materialized_tables

  display_name    = each.value.display_name
  query           = each.value.query
  rest_endpoint   = each.value.rest_endpoint
  session_options = each.value.session_options
  stopped         = each.value.stopped
  table_options   = each.value.table_options

  kafka_cluster {
    id = each.value.kafka_cluster.id
  }

  dynamic "columns" {
    for_each = each.value.columns != null ? each.value.columns : []
    content {
      dynamic "columns_computed" {
        for_each = columns.value.columns_computed != null ? columns.value.columns_computed : []
        content {
          column_computed_comment    = columns_computed.value.column_computed_comment
          column_computed_expression = columns_computed.value.column_computed_expression
          column_computed_kind       = columns_computed.value.column_computed_kind
          column_computed_name       = columns_computed.value.column_computed_name
          column_computed_type       = columns_computed.value.column_computed_type
          column_computed_virtual    = columns_computed.value.column_computed_virtual
        }
      }
      dynamic "columns_metadata" {
        for_each = columns.value.columns_metadata != null ? columns.value.columns_metadata : []
        content {
          column_metadata_comment = columns_metadata.value.column_metadata_comment
          column_metadata_key     = columns_metadata.value.column_metadata_key
          column_metadata_kind    = columns_metadata.value.column_metadata_kind
          column_metadata_name    = columns_metadata.value.column_metadata_name
          column_metadata_type    = columns_metadata.value.column_metadata_type
          column_metadata_virtual = columns_metadata.value.column_metadata_virtual
        }
      }
      dynamic "columns_physical" {
        for_each = columns.value.columns_physical != null ? columns.value.columns_physical : []
        content {
          column_physical_comment = columns_physical.value.column_physical_comment
          column_physical_kind    = columns_physical.value.column_physical_kind
          column_physical_name    = columns_physical.value.column_physical_name
          column_physical_type    = columns_physical.value.column_physical_type
        }
      }
    }
  }

  dynamic "compute_pool" {
    for_each = each.value.compute_pool != null ? [each.value.compute_pool] : []
    content {
      id = compute_pool.value.id
    }
  }

  dynamic "constraints" {
    for_each = each.value.constraints != null ? each.value.constraints : []
    content {
      columns  = constraints.value.columns
      enforced = constraints.value.enforced
      name     = constraints.value.name
      type     = constraints.value.type
    }
  }

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      key    = credentials.value.key
      secret = credentials.value.secret
    }
  }

  dynamic "distribution" {
    for_each = each.value.distribution != null ? [each.value.distribution] : []
    content {
      bucket_count = distribution.value.bucket_count
      keys         = distribution.value.keys
      kind         = distribution.value.kind
    }
  }

  dynamic "environment" {
    for_each = each.value.environment != null ? [each.value.environment] : []
    content {
      id = environment.value.id
    }
  }

  dynamic "organization" {
    for_each = each.value.organization != null ? [each.value.organization] : []
    content {
      id = organization.value.id
    }
  }

  dynamic "principal" {
    for_each = each.value.principal != null ? [each.value.principal] : []
    content {
      id = principal.value.id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "watermark" {
    for_each = each.value.watermark != null ? [each.value.watermark] : []
    content {
      column     = watermark.value.column
      expression = watermark.value.expression
    }
  }
}

