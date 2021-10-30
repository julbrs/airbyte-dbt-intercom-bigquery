{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_intercom_conversations_hashid,
    cast(url as {{ dbt_utils.type_string() }}) as url,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    cast(created_at as {{ dbt_utils.type_bigint() }}) as created_at,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_first_contact_reply_ab1') }}
-- first_contact_reply at intercom_conversations/first_contact_reply

