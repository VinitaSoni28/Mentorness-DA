SELECT * FROM corona;
SELECT * from corona where Province is null or `Country/Region` is null or Latitude is null or
 Longitude is null or date is null or Confirmed is null or Deaths is null or Recovered is null;
 set SQL_SAFE_UPDATES = 0;
 update corona set province = coalesce(province, ''), latitude = coalesce(latitude, 0), 
 `Country/Region` = coalesce(`Country/Region`, 0), longitude = coalesce(longitude, 0),
 date = coalesce(date, 0), confirmed = coalesce(confirmed, 0), deaths = coalesce(deaths, 0),
 recovered = coalesce(recovered, 0);
  select count(*) from corona;
 SELECT date from corona order by date DESC limit 1;
 SELECT date from corona order by date limit 1;
 select count(distinct(substr(date, 4, 2))) months from corona;
 select substr(date, 7) as year, substr(date, 4, 2) as month, avg(confirmed) as confirmed_avg,
 avg(deaths) as death_avg, avg(recovered) as recovered_avg from corona group by year, month;
 select substr(date, 7) as year, substr(date, 4, 2) as month, max(confirmed) as most_freq_confirmed,
max(deaths) as most_freq_deaths, max(deaths) as most_freq_recovered from corona group by year, month;
select substr(date, 7) as year, min(confirmed) as min_confirm,
min(deaths) as min_deaths, min(deaths) as min_recovered from corona group by year;
select substr(date, 7) as year, max(confirmed) as max_confifrm,
max(deaths) as max_deaths, max(deaths) as max_recovered from corona group by year;
select substr(date, 4, 2) as month, count(confirmed) as total_num_confirmed, count(deaths) as total_num_deaths,
count(deaths) as total_num_recovered from corona group by month;
select count(confirmed) as total_confirmed_cases, avg(confirmed) as avg_confirmed,
( select avg((confirmed - (select avg(confirmed) from corona)) * (confirmed-(select avg(confirmed) from corona))) from corona )
 as verience_confirmed, 
( select sqrt(avg((confirmed-(select avg(confirmed) from corona)) * (confirmed- (select avg(confirmed) from corona))))
from corona ) as std_confirmed from corona;
select substr(date, 7) as year, substr(date, 4, 2) as month, count(deaths) as total_deaths_cases, avg(deaths) as avg_deaths,
(select avg((deaths - (select avg(deaths) from corona)) * (deaths-(select avg(deaths) from corona))) from corona) 
as verience_confimed,
(select sqrt(avg((deaths-(select avg(deaths) from corona)) * (deaths- (select avg(deaths) from corona)))) from corona)
as std_deaths from corona group by year, month;
select count(recovered) as total_recovered_cases, avg(recovered) as avg_recovered,
(select avg((recovered - (select avg(recovered) from corona)) * (recovered- (select avg(recovered) from corona))) from corona)
as verience_confirmed,
(select sqrt(avg((recovered-(select avg(recovered) from corona)) * (recovered- (select avg(recovered) from corona))))
from corona) as std_recovered from corona;
select `Country/Region`, max(confirmed) as high_confirm from corona group by `Country/Region` order by high_confirm desc 
limit 1;
select `Country/Region`, min(deaths) as low_death from corona group by `Country/Region` order by low_death asc;
select `Country/Region`, recovered from corona order by recovered desc limit 5;