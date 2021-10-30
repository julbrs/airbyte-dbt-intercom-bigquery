{{ config(
    schema="main", 
    tags=["top-level"], 
    materialized='incremental', 
    unique_key='_airbyte_hashid', 
    on_schema_change='append_new_columns',
    ) }}
-- Final base SQL model
select
    'intercom' as source,
    id,
    TIMESTAMP_MILLIS(created_at) as created_at,
    conversation_id as ticket_id,
    _airbyte_emitted_at,
    _airbyte_intercom_conversation_parts_hashid as _airbyte_hashid
from {{ ref('intercom_conversation_parts_ab3') }}
-- intercom_conversation_parts from {{ source('main', '_airbyte_raw_intercom_conversation_parts') }}

