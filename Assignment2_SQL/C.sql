--1

Select name from Restaurant where Cuisine = 'Indian';

--2

select distinct name, rating.stars from Restaurant, Rating where Restaurant.rid = Rating.rid and rating.stars >=4 order by rating.stars asc;

--3

Select name from Restaurant where rid not in (select rid from Rating);

--4 

Select Name from Reviewer where VID in (select VID from Rating where ratingDate is null);

--5 

Select rv.name, r.name from Reviewer rv, Restaurant r, Rating rt, Rating rt2 
where rv.vid = rt.vid and rt.rid = r.rid
and rt.vid = rt2.vid and rt.stars > rt2.stars and rt.ratingdate > rt2.ratingdate;

--6

Select r.name, Max(rt.stars) from Restaurant r, Rating rt, Rating rt2 
where r.rid = rt.rid and rt.rid = rt2.rid and rt.stars > ALL(rt2.stars)
group by r.name
order by r.name;

--7

Select r.name, max(rt.stars) - min(rt.stars) as pot from Restaurant r, Rating rt, Rating rt2
where r.rid = rt.rid and rt.rid = rt2.rid
group by r.name
order by pot desc, r.name;

--8


select Avg(t1.avs) - Avg(t2.avs) as Difference
from
(Select r.rid, Avg(rt.stars) as avs from Restaurant r, Rating rt where r.rid = rt.rid and r.cuisine = 'Indian'
group by r.rid) t1, 
(Select r.rid, Avg(rt.stars) as avs from Restaurant r, Rating rt where r.rid = rt.rid and r.cuisine = 'Chinese'
group by r.rid) t2;


