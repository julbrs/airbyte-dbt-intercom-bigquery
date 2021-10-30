{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'id',
        'type',
    ]) }} as _airbyte_contacts_hashid,
    tmp.*
from {{ ref('intercom_conversations_contacts_ab2') }} tmp
-- contacts at intercom_conversations/contacts

