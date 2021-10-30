{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'id',
        'type',
    ]) }} as _airbyte_user_hashid,
    tmp.*
from {{ ref('intercom_conversations_user_ab2') }} tmp
-- user at intercom_conversations/user

