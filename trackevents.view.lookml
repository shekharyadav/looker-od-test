- view: trackevents
  sql_table_name: public.trackevents
  fields:

  - dimension: _id
    sql: ${TABLE}._id

  - dimension: bid_id
    sql: ${TABLE}.bid_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month, hour, hour_of_day, day_of_week]
    sql: ${TABLE}.created_at

  - dimension: custom
    sql: ${TABLE}.custom

  - dimension: event_type
    sql: ${TABLE}.event_type

  - dimension: imp
    sql: ${TABLE}.imp

  - dimension: imp_id
    sql: ${TABLE}.imp_id

  - dimension: organization_id
    sql: ${TABLE}.organization_id
    
  - dimension: campaign_id
    sql: ${TABLE}.campaign_id

  - dimension: price
    type: number
    sql: ${TABLE}.price
  
  - measure: spend
    type: sum
    format: '$%.2f'
    sql: ${TABLE}.price/1000
    
  - measure: impressions
    type: count
    filters:
      event_type: '%imp'
      
  - measure: clicks
    type: count
    filters:
      event_type: '%click'
      
  - measure: installs
    type: count
    filters:
      event_type: '%conv'
    
  - measure: cpm
    type: number
    format: '$%.2f'
    sql: (${spend}*1000)/NULLIF(${impressions}, 0)
    
  - measure: cpi
    type: number
    format: '$%.2f'
    sql: (${spend})/NULLIF(${installs},0 )
    
  - measure: cpc
    type: number
    format: '$%.2f'
    sql: (${spend})/NULLIF(${clicks}, 0)
    
  - measure: average_cpm
    type: average
    format: '$%.2f'
    sql: ${price}

  - dimension: remote_ip
    sql: ${TABLE}.remote_ip

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: user_agent
    sql: ${TABLE}.user_agent
    
  - dimension: cord
    sql_latitude: ${TABLE}.lat
    sql_longitude: ${TABLE}.lng
    type: location

  - measure: count
    type: count
    drill_fields: []

