{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'id',
        'body',
        'type',
        'author',
        boolean_to_string('redacted'),
        'part_type',
        'created_at',
        'updated_at',
        'assigned_to',
        'attachments',
        'external_id',
        'notified_at',
        'conversation_id',
        'conversation_created_at',
        'conversation_updated_at',
        'conversation_total_parts',
    ]) }} as _airbyte_intercom_conversation_parts_hashid,
    tmp.*
from {{ ref('intercom_conversation_parts_ab2') }} tmp
-- intercom_conversation_parts

