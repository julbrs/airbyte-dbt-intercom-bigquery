{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversation_parts_hashid',
        'id',
        'name',
        'type',
        'email',
    ]) }} as _airbyte_author_hashid,
    tmp.*
from {{ ref('intercom_conversation_parts_author_ab2') }} tmp
-- author at intercom_conversation_parts/author

