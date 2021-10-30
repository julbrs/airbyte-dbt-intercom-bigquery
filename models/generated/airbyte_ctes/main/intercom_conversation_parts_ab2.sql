{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(id as {{ dbt_utils.type_string() }}) as id,
    cast(body as {{ dbt_utils.type_string() }}) as body,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    cast(author as {{ type_json() }}) as author,
    {{ cast_to_boolean('redacted') }} as redacted,
    cast(part_type as {{ dbt_utils.type_string() }}) as part_type,
    cast(created_at as {{ dbt_utils.type_bigint() }}) as created_at,
    cast(updated_at as {{ dbt_utils.type_bigint() }}) as updated_at,
    assigned_to,
    attachments,
    cast(external_id as {{ dbt_utils.type_string() }}) as external_id,
    cast(notified_at as {{ dbt_utils.type_bigint() }}) as notified_at,
    cast(conversation_id as {{ dbt_utils.type_string() }}) as conversation_id,
    cast(conversation_created_at as {{ dbt_utils.type_bigint() }}) as conversation_created_at,
    cast(conversation_updated_at as {{ dbt_utils.type_bigint() }}) as conversation_updated_at,
    cast(conversation_total_parts as {{ dbt_utils.type_bigint() }}) as conversation_total_parts,
    _airbyte_emitted_at
from {{ ref('intercom_conversation_parts_ab1') }}
-- intercom_conversation_parts

