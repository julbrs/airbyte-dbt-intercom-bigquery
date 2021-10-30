{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'id',
        'name',
        'type',
        'applied_at',
        'applied_by',
    ]) }} as _airbyte_tags_hashid,
    tmp.*
from {{ ref('intercom_conversations_tags_ab2') }} tmp
-- tags at intercom_conversations/tags

