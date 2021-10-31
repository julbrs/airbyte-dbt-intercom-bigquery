{{ config(schema="_airbyte_main", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_intercom_conversations_hashid,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    cast(count_reopens as {{ dbt_utils.type_bigint() }}) as count_reopens,
    cast(last_close_at as {{ dbt_utils.type_bigint() }}) as last_close_at,
    cast(first_close_at as {{ dbt_utils.type_bigint() }}) as first_close_at,
    cast(count_assignments as {{ dbt_utils.type_bigint() }}) as count_assignments,
    cast(last_closed_by_id as {{ dbt_utils.type_bigint() }}) as last_closed_by_id,
    cast(last_assignment_at as {{ dbt_utils.type_bigint() }}) as last_assignment_at,
    cast(time_to_assignment as {{ dbt_utils.type_bigint() }}) as time_to_assignment,
    cast(time_to_last_close as {{ dbt_utils.type_bigint() }}) as time_to_last_close,
    cast(first_assignment_at as {{ dbt_utils.type_bigint() }}) as first_assignment_at,
    cast(last_admin_reply_at as {{ dbt_utils.type_bigint() }}) as last_admin_reply_at,
    cast(time_to_admin_reply as {{ dbt_utils.type_bigint() }}) as time_to_admin_reply,
    cast(time_to_first_close as {{ dbt_utils.type_bigint() }}) as time_to_first_close,
    cast(first_admin_reply_at as {{ dbt_utils.type_bigint() }}) as first_admin_reply_at,
    cast(median_time_to_reply as {{ dbt_utils.type_bigint() }}) as median_time_to_reply,
    cast(last_contact_reply_at as {{ dbt_utils.type_bigint() }}) as last_contact_reply_at,
    cast(first_contact_reply_at as {{ dbt_utils.type_bigint() }}) as first_contact_reply_at,
    cast(count_conversation_parts as {{ dbt_utils.type_bigint() }}) as count_conversation_parts,
    cast(last_assignment_admin_reply_at as {{ dbt_utils.type_bigint() }}) as last_assignment_admin_reply_at,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_statistics_ab1') }}
-- statistics at intercom_conversations/statistics