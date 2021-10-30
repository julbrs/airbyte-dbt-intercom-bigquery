{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        'id',
        boolean_to_string('open'),
        boolean_to_string('read'),
        'tags',
        'type',
        'user',
        'state',
        'title',
        'source',
        'sent_at',
        'assignee',
        'contacts',
        'priority',
        boolean_to_string('redacted'),
        'customers',
        'teammates',
        'created_at',
        'statistics',
        'updated_at',
        'sla_applied',
        'snoozed_until',
        'waiting_since',
        'team_assignee_id',
        'admin_assignee_id',
        'conversation_rating',
        'first_contact_reply',
        'conversation_message',
        'customer_first_reply',
    ]) }} as _airbyte_intercom_conversations_hashid,
    tmp.*
from {{ ref('intercom_conversations_ab2') }} tmp
-- intercom_conversations

