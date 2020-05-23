--1
select rentalCompany, mileage from ByCar where mileage >= 27;

--2

select TID from Trips where TravelMode = 'Train' and Fare > 150;

--3
select TID, Fare from Trips where TripState = 'Non-US';

--4

Select ByPlane.TID from ByPlane, Trips where ByPlane.tid = Trips.tid and ByPlane.class = 'Business' and Trips.fare > 1000;

--5

Select * from

(Select * from Trips where TravelMode = 'Car') a ,

(select * from Trips where TravelMode = 'Train') b

where a.Fare > b.Fare and (a.TripState = b.TripState or b.Tripstate = 'Non-US');

-6

Select distinct a.tid, b.tid from ByCar a , ByCar b where a.TID != b.TID and a.mileage = b.mileage;

-7

select distinct a.tid, b.tid from ByTrain a, ByTrain b where a.TID != b.TID and a.Trainspeed != b.Trainspeed;

-8 

select a.tid, b.tid from Trips a, Trips b where a.TID < b.TID and a.TripState = b.TripState and a.TravelMode = b.TravelMode;

-9

Select distinct a.tripState from Trips a, Trips b, Trips c where a.tripState = b.tripState and b.TripState = c.tripState and a.travelmode != b.travelmode and b.travelmode != c.travelmode;

-10

--a) most expensive
select a.* from trips a, trips b where a.fare > b.fare and rownum = 1;

--b) cheapest

select a.* from trips a, trips b where a.fare < b.fare and rownum = 1;