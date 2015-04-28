- connection: odsp-events

- scoping: true                  # for backward compatibility
- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

#- explore: trackevents

- explore: trackevents
  always_join: [campaigns]
  joins:
    - join: campaigns
      foreign_key: campaign_id
      type: inner