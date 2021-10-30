{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_intercom_conversations_hashid,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    admins,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_teammates_ab1') }}
-- teammates at intercom_conversations/teammates

