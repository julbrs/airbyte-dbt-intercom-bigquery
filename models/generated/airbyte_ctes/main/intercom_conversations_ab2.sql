{{ config(schema="_airbyte_main", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(id as {{ dbt_utils.type_string() }}) as id,
    {{ cast_to_boolean('open') }} as open,
    {{ cast_to_boolean('read') }} as read,
    cast(tags as {{ type_json() }}) as tags,
    cast(type as {{ dbt_utils.type_string() }}) as type,
    cast(user as {{ type_json() }}) as user,
    cast(state as {{ dbt_utils.type_string() }}) as state,
    cast(title as {{ dbt_utils.type_string() }}) as title,
    cast(source as {{ type_json() }}) as source,
    cast(sent_at as {{ dbt_utils.type_bigint() }}) as sent_at,
    cast(assignee as {{ type_json() }}) as assignee,
    cast(contacts as {{ type_json() }}) as contacts,
    cast(priority as {{ dbt_utils.type_string() }}) as priority,
    {{ cast_to_boolean('redacted') }} as redacted,
    customers,
    cast(teammates as {{ type_json() }}) as teammates,
    cast(created_at as {{ dbt_utils.type_bigint() }}) as created_at,
    cast(statistics as {{ type_json() }}) as statistics,
    cast(updated_at as {{ dbt_utils.type_bigint() }}) as updated_at,
    cast(sla_applied as {{ type_json() }}) as sla_applied,
    cast(snoozed_until as {{ dbt_utils.type_bigint() }}) as snoozed_until,
    cast(waiting_since as {{ dbt_utils.type_bigint() }}) as waiting_since,
    cast(team_assignee_id as {{ dbt_utils.type_bigint() }}) as team_assignee_id,
    cast(admin_assignee_id as {{ dbt_utils.type_bigint() }}) as admin_assignee_id,
    cast(conversation_rating as {{ type_json() }}) as conversation_rating,
    cast(first_contact_reply as {{ type_json() }}) as first_contact_reply,
    cast(conversation_message as {{ type_json() }}) as conversation_message,
    cast(customer_first_reply as {{ type_json() }}) as customer_first_reply,
    _airbyte_emitted_at
from {{ ref('intercom_conversations_ab1') }}
-- intercom_conversations

