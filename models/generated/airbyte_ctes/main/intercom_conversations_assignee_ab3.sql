{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'id',
        'name',
        'type',
        'email',
    ]) }} as _airbyte_assignee_hashid,
    tmp.*
from {{ ref('intercom_conversations_assignee_ab2') }} tmp
-- assignee at intercom_conversations/assignee

