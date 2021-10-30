{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'id',
        'url',
        'body',
        'type',
        'author',
        'subject',
        'attachments',
        'delivered_as',
    ]) }} as _airbyte_conversation_message_hashid,
    tmp.*
from {{ ref('intercom_conversations_conversation_message_ab2') }} tmp
-- conversation_message at intercom_conversations/conversation_message

