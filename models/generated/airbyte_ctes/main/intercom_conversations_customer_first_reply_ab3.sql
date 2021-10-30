{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'url',
        'type',
        'created_at',
    ]) }} as _airbyte_customer_first_reply_hashid,
    tmp.*
from {{ ref('intercom_conversations_customer_first_reply_ab2') }} tmp
-- customer_first_reply at intercom_conversations/customer_first_reply

