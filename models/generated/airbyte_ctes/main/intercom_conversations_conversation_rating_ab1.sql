{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('conversation_rating', ['rating'], ['rating']) }} as rating,
    {{ json_extract_scalar('conversation_rating', ['remark'], ['remark']) }} as remark,
    {{ json_extract('table_alias', 'conversation_rating', ['customer'], ['customer']) }} as customer,
    {{ json_extract('table_alias', 'conversation_rating', ['teammate'], ['teammate']) }} as teammate,
    {{ json_extract_scalar('conversation_rating', ['created_at'], ['created_at']) }} as created_at,
    _airbyte_emitted_at
from {{ ref('intercom_conversations') }} as table_alias
where conversation_rating is not null
-- conversation_rating at intercom_conversations/conversation_rating

