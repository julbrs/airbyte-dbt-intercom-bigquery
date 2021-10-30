{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('customer_first_reply', ['url'], ['url']) }} as url,
    {{ json_extract_scalar('customer_first_reply', ['type'], ['type']) }} as type,
    {{ json_extract_scalar('customer_first_reply', ['created_at'], ['created_at']) }} as created_at,
    _airbyte_emitted_at
from {{ ref('intercom_conversations') }} as table_alias
where customer_first_reply is not null
-- customer_first_reply at intercom_conversations/customer_first_reply

