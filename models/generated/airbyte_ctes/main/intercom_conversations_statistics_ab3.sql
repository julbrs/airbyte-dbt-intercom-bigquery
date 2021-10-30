{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'type',
        'count_reopens',
        'last_close_at',
        'first_close_at',
        'count_assignments',
        'last_closed_by_id',
        'last_assignment_at',
        'time_to_assignment',
        'time_to_last_close',
        'first_assignment_at',
        'last_admin_reply_at',
        'time_to_admin_reply',
        'time_to_first_close',
        'first_admin_reply_at',
        'median_time_to_reply',
        'last_contact_reply_at',
        'first_contact_reply_at',
        'count_conversation_parts',
        'last_assignment_admin_reply_at',
    ]) }} as _airbyte_statistics_hashid,
    tmp.*
from {{ ref('intercom_conversations_statistics_ab2') }} tmp
-- statistics at intercom_conversations/statistics

