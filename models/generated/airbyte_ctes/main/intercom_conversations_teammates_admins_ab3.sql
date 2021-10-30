{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_teammates_hashid',
        'id',
        'type',
    ]) }} as _airbyte_admins_hashid,
    tmp.*
from {{ ref('intercom_conversations_teammates_admins_ab2') }} tmp
-- admins at intercom_conversations/teammates/admins

