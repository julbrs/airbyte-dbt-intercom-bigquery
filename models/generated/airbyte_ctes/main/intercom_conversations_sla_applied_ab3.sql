{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'sla_name',
        'sla_status',
    ]) }} as _airbyte_sla_applied_hashid,
    tmp.*
from {{ ref('intercom_conversations_sla_applied_ab2') }} tmp
-- sla_applied at intercom_conversations/sla_applied

