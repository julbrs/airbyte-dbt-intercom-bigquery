{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_tags_hashid,
    cast(id as {{ dbt_utils.type_string() }}) as id,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_tags_applied_by_ab1') }}
-- applied_by at intercom_conversations/tags/applied_by

