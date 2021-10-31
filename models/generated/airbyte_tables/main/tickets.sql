{{ config(
    schema="main", 
    tags=["top-level"], 
    materialized='incremental', 
    unique_key='_airbyte_hashid', 
    on_schema_change='append_new_columns',
    ) }}
-- Final base SQL model
select
    c.source,
    c.id,
    c.state as status,
    TIMESTAMP_MILLIS(c.created_at) as created_at,
    TIMESTAMP_MILLIS(c.updated_at) as updated_at,
    s.count_conversation_parts as count_conversation_parts,
    datetime_diff(TIMESTAMP_MILLIS(s.first_admin_reply_at), TIMESTAMP_MILLIS(c.updated_at), MINUTE) as first_response_time_min,
    datetime_diff(TIMESTAMP_MILLIS(s.last_admin_reply_at), TIMESTAMP_MILLIS(c.updated_at), MINUTE) as total_response_time_min,
    c._airbyte_emitted_at,
    c._airbyte_intercom_conversations_hashid as _airbyte_hashid
from {{ ref('intercom_conversations_ab3') }} c
join {{ ref('intercom_conversations_statistics_ab2') }} s using (_airbyte_intercom_conversations_hashid)
-- intercom_conversations from {{ source('main', '_airbyte_raw_intercom_conversations') }}

