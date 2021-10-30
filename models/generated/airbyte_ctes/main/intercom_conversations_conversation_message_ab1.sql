{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('conversation_message', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('conversation_message', ['url'], ['url']) }} as url,
    {{ json_extract_scalar('conversation_message', ['body'], ['body']) }} as body,
    {{ json_extract_scalar('conversation_message', ['type'], ['type']) }} as type,
    {{ json_extract('table_alias', 'conversation_message', ['author'], ['author']) }} as author,
    {{ json_extract_scalar('conversation_message', ['subject'], ['subject']) }} as subject,
    {{ json_extract('table_alias', 'conversation_message', ['attachments']) }} as attachments,
    {{ json_extract_scalar('conversation_message', ['delivered_as'], ['delivered_as']) }} as delivered_as,
    _airbyte_emitted_at
from {{ ref('intercom_conversations') }} as table_alias
where conversation_message is not null
-- conversation_message at intercom_conversations/conversation_message

