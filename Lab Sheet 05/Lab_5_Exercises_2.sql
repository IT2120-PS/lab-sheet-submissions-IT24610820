--a. Find the names of stars who have acted in movies directed by “Jon Watts”.
select * from StarsIn
select * from Movie

select s.starname
from StarsIn s,Movie m
where s.movieTitle=m.title and m.DirectorName='Jon Watts'

--b. List the movies shown in theaters in “LA” along with the total number of spectators

select * from Theater
select * from Show

select s.movieTitle,s.spectators
from Theater t,Show s
where t.theaterName=s.theaterName and t.city='LA'

--c. Display the names of customers who have booked tickets for more than on different movie.

select * from Booking

select distinct b.custName
from Booking b,Show s
where b.showId=s.showId
group by b.custName
having count( distinct s.movieTitle)>1


--d. Find the theaters in which the total income from all shows exceeds 50,000.

select t.theaterName
from Theater t,Show s
where t.theaterName=s.theaterName
group by t.theaterName
having sum(spectators*ticketPrice)>50000

--e Find the customers who have booked tickets for movies in more than one theater


select * from Booking

select distinct s.theaterName
from Booking b,Show s
where b.showId=s.showId
group by s.theaterName
having count( distinct s.theaterName)>1