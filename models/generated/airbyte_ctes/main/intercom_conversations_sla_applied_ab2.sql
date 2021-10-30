{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_intercom_conversations_hashid,
    cast(sla_name as {{ dbt_utils.type_string() }}) as sla_name,
    cast(sla_status as {{ dbt_utils.type_string() }}) as sla_status,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_sla_applied_ab1') }}
-- sla_applied at intercom_conversations/sla_applied

