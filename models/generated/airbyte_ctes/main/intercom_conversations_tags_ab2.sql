{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_intercom_conversations_hashid,
    cast(id as {{ dbt_utils.type_string() }}) as id,
    cast(name as {{ dbt_utils.type_string() }}) as name,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    cast(applied_at as {{ dbt_utils.type_bigint() }}) as applied_at,
    cast(applied_by as {{ type_json() }}) as applied_by,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_tags_ab1') }}
-- tags at intercom_conversations/tags

