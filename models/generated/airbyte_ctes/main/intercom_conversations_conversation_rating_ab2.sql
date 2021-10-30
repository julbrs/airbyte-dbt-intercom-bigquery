{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_intercom_conversations_hashid,
    cast(rating as {{ dbt_utils.type_bigint() }}) as rating,
    cast(remark as {{ dbt_utils.type_string() }}) as remark,
    cast(customer as {{ type_json() }}) as customer,
    cast(teammate as {{ type_json() }}) as teammate,
    cast(created_at as {{ dbt_utils.type_bigint() }}) as created_at,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_conversation_rating_ab1') }}
-- conversation_rating at intercom_conversations/conversation_rating

