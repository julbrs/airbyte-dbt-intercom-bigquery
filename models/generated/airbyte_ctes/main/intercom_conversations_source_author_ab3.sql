{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_source_hashid',
        'id',
        'name',
        'type',
        'email',
    ]) }} as _airbyte_author_hashid,
    tmp.*
from {{ ref('intercom_conversations_source_author_ab2') }} tmp
-- author at intercom_conversations/source/author

