{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_conversation_rating_hashid',
        'id',
        'type',
    ]) }} as _airbyte_teammate_hashid,
    tmp.*
from {{ ref('intercom_conversations_conversation_rating_teammate_ab2') }} tmp
-- teammate at intercom_conversations/conversation_rating/teammate

