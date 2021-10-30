{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    {{ dbt_utils.surrogate_key([
        '_airbyte_intercom_conversations_hashid',
        'id',
        'url',
        'body',
        'type',
        'author',
        'subject',
        boolean_to_string('redacted'),
        array_to_string('attachments'),
        'delivered_as',
    ]) }} as _airbyte_source_hashid,
    tmp.*
from {{ ref('intercom_conversations_source_ab2') }} tmp
-- source at intercom_conversations/source

