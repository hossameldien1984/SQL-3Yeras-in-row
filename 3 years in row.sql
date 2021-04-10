with seq as(
SELECT name, year st
,lead(year) over ( partition by name order by year) nd
,lead(year,2) over ( partition by name order by year) ed
FROM my_tasks.participants
order by name,year)
select name
from seq
where nd is not null
and ed is not null
and ed=nd+1
and nd=st+1
group by name ;