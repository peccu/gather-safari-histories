.header on
.mode csv
select
-- visit_time is NSDate
    datetime(visit_time + 978307200, 'unixepoch', 'localtime') as date,
    title,
    domain_expansion,
    url
from history_visits
    join history_items
    on history_visits.history_item = history_items.id
where
    visit_time > strftime('%s', 'now', 'start of day') - 978307200
group by
    history_item
order by
    visit_time asc;
