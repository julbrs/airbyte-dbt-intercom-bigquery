{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_conversation_rating_hashid,
    cast(id as {{ dbt_utils.type_string() }}) as id,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_conversation_rating_customer_ab1') }}
-- customer at intercom_conversations/conversation_rating/customer

