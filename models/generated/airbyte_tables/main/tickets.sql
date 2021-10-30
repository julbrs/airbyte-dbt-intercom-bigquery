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
    state as status,
    TIMESTAMP_MILLIS(created_at) as created_at,
    TIMESTAMP_MILLIS(updated_at) as updated_at,
    _airbyte_emitted_at,
    _airbyte_intercom_conversations_hashid as _airbyte_hashid
from {{ ref('intercom_conversations_ab3') }}
-- intercom_conversations from {{ source('main', '_airbyte_raw_intercom_conversations') }}

