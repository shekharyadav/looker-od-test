- view: campaigns
  sql_table_name: public.campaigns
  fields:

  - dimension: _id
    sql: ${TABLE}._id
    primary_key: true

  - dimension: name
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [name, trackevents.count]

