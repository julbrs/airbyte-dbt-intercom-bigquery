{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_intercom_conversations_hashid,
    {{ json_extract_scalar('source', ['id'], ['id']) }} as id,
    {{ json_extract_scalar('source', ['url'], ['url']) }} as url,
    {{ json_extract_scalar('source', ['body'], ['body']) }} as body,
    {{ json_extract_scalar('source', ['type'], ['type']) }} as type,
    {{ json_extract('table_alias', 'source', ['author'], ['author']) }} as author,
    {{ json_extract_scalar('source', ['subject'], ['subject']) }} as subject,
    {{ json_extract_scalar('source', ['redacted'], ['redacted']) }} as redacted,
    {{ json_extract_array('source', ['attachments'], ['attachments']) }} as attachments,
    {{ json_extract_scalar('source', ['delivered_as'], ['delivered_as']) }} as delivered_as,
    _airbyte_emitted_at
from {{ ref('intercom_conversations') }} as table_alias
where source is not null
-- source at intercom_conversations/source

