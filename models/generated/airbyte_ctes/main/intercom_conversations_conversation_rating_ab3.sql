{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'rating',
        'remark',
        'customer',
        'teammate',
        'created_at',
    ]) }} as _airbyte_conversation_rating_hashid,
    tmp.*
from {{ ref('intercom_conversations_conversation_rating_ab2') }} tmp
-- conversation_rating at intercom_conversations/conversation_rating

