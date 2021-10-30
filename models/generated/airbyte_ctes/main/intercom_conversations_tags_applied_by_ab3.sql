{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_tags_hashid',
        'id',
        'type',
    ]) }} as _airbyte_applied_by_hashid,
    tmp.*
from {{ ref('intercom_conversations_tags_applied_by_ab2') }} tmp
-- applied_by at intercom_conversations/tags/applied_by

