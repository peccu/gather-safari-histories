.header on
.mode csv
-- visit_time is NSDate
select
    datetime(visit_time + 978307200, 'unixepoch', 'localtime') as date,
    title,
    domain_expansion,
    url
from history_visits
    join history_items
    on history_visits.history_item = history_items.id
where
    visit_time > strftime('%s', 'now', 'localtime', 'start of day', '-1 day', 'utc') - 978307200
    and visit_time <= strftime('%s', 'now', 'localtime', 'start of day', 'utc') - 978307200
group by
    history_item
order by
    visit_time asc;
