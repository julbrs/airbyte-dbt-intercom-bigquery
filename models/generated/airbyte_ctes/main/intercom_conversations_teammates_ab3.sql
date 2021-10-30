{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'type',
        array_to_string('admins'),
    ]) }} as _airbyte_teammates_hashid,
    tmp.*
from {{ ref('intercom_conversations_teammates_ab2') }} tmp
-- teammates at intercom_conversations/teammates

