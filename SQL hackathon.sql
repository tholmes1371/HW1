--.1)
select genre, sum(revenue) as totalRev
from movies
group by genre
having sum(revenue) > 2000000000;

GENRE	TOTALREV
Family	2560037794
Comedy	4745077086
Animation	2421377195
Action	5609921098
Fantasy	2050915506
Sci	6158051307

--2.)
select count(actorid)
from actors
where total_gross / num_movies > (select total_gross / num_movies from actors where name = 'Will Smith');

COUNT(ACTORID)
9

--3.)
select title, revenue
from movies
where revenue = (select max(revenue) from movies);

TITLE	REVENUE
Avatar	749766139

--4.)
--a.)
SELECT name
FROM movies, movie_to_actor, actors 
WHERE movies.movieid = movie_to_actor.movieid and movie_to_actor.actorid = actors.actorid and movies.title = 'Catch Me If You Can';

NAME
Christopher Walken
Leonardo DiCaprio
Jennifer Garner
James Brolin
Elizabeth Banks
Amy Adams

--b.)
SELECT name
FROM movies, movie_to_actor, actors 
WHERE movies.movieid = movie_to_actor.movieid and movie_to_actor.actorid = actors.actorid and movies.title = (select title from movies where title = 'Catch Me If You Can');


NAME
Christopher Walken
Leonardo DiCaprio
Jennifer Garner
James Brolin
Elizabeth Banks
Amy Adams

--5.)
select movies.title, count(actors.name)
FROM movies, actors, movie_to_actor
Where movies.year = 2013 and movies.movieid = movie_to_actor.movieid and actors.actorid = movie_to_actor.actorid
group by movies.title;

TITLE	COUNT(ACTORS.NAME)
Star Trek Into Darkness	9
G.I. Joe: Retaliation	4