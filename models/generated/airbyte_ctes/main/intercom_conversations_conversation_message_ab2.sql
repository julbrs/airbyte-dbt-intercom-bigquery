{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_intercom_conversations_hashid,
    cast(id as {{ dbt_utils.type_string() }}) as id,
    cast(url as {{ dbt_utils.type_string() }}) as url,
    cast(body as {{ dbt_utils.type_string() }}) as body,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    cast(author as {{ type_json() }}) as author,
    cast(subject as {{ dbt_utils.type_string() }}) as subject,
    attachments,
    cast(delivered_as as {{ dbt_utils.type_string() }}) as delivered_as,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_conversation_message_ab1') }}
-- conversation_message at intercom_conversations/conversation_message

