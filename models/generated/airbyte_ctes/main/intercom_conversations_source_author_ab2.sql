{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_source_hashid,
    cast(id as {{ dbt_utils.type_string() }}) as id,
    cast(name as {{ dbt_utils.type_string() }}) as name,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    cast(email as {{ dbt_utils.type_string() }}) as email,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_source_author_ab1') }}
-- author at intercom_conversations/source/author

