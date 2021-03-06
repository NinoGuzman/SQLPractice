
-- Exercise 1: Show all the distinct age classifications that exists

SELECT DISTINCT classification_age
FROM movie

-- Exercise 2: Find cinemas that do not display any movie

select cinema_name
from cinema
minus
select distinct cinema_name
from cinema c
natural join billboard b
natural join movie m

-- Exercise 3: Find movies with classification age greater than 16 that are not displayed at any cinema

select movie_name
from movie
where id_movie = (
    select id_movie
    from movie
    minus
    select distinct id_movie
    from billboard
    )


--Exercise 4:
-- a) Show movies that do not have information about age classification

select movie_name from  movie
where classification_age is null

--b) Update the information from movies that meet above criteria setting those values to 0 (for all public)

update movie
set classification_age = 0
where classification_age is null



-- Exercise 5: Delete movies with classification age above 18 that are not display at any cinema

delete from movie
where movie_name = (
select movie_name
from movie
where id_movie in (
    select id_movie
    from movie
    minus
    select distinct id_movie
    from billboard
    )
and classification_age > 18
)


-- Exercise 6: Count the number of movies available in each cinema

select cinema_name, count(distinct id_movie) Total_movies
from cinema c
natural join billboard b
natural join movie m
group by cinema_name


-- Exercise 7: Show the cinemas that display more movies than the number of available screens

with tab_aux as(
    select count(distinct id_movie) Total_movies
    from cinema c
    natural join billboard b
    group by cinema_name

)

select c.cinema_name, c.number_screens, t.Total_movies
from tab_aux t, cinema c
where  c.number_screens > t.Total_movies



-- Exercise 8: Show cinemas that display only movies for all public (classification_age = 0)

select id_cinema, cinema_name
from movie m
natural join billboard b
natural join cinema c
where m.classification_age = 0

-- Exercise 9: Show movies with for public older than 12 that are display in cinemas with number of screens available greater than 5.

select movie_name, classification_age, number_screens
from movie m
natural join billboard b
natural join cinema c
where m.classification_age > 12
and c.number_screens > 5


-- Exercise 10: Select cinemas, and movies in those cinemas, whose classification age is different from 18.

select cinema_name, movie_name, classification_age
from movie m
natural join billboard b
natural join cinema c
where m.classification_age in (
    select distinct classification_age
    from movie
    where classification_age != 18
)
