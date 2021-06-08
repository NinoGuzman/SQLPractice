
-- Developed by Nino Guzman De la O
-- Date June 2nd, 2021
-- Medium account: ninogdo


create table cinema(
  id_cinema number(3,0),
  cinema_name    varchar2(100),
  number_screens    number(3,0),
  constraint pk_cinema primary key (id_cinema)
);

create table movie(
  id_movie    number(3,0),
  movie_name varchar2(100),
  classification_age  number(3,0),
  constraint pk_movie primary key (id_movie)
);

create table billboard(
  id_cinema   number(3,0),
  id_movie    number(3,0),
  constraint fk_cinema foreign key (id_cinema) references cinema (id_cinema),
  constraint fk_movie foreign key (id_movie) references movie (id_movie)
);


-- CINEMA TABLE

insert into cinema
values(001, 'Cinema_A', 5);

insert into cinema
values(002, 'Cinema_B', 10);

insert into cinema
values(003, 'Cinema_C', 8);

insert into cinema
values(004, 'Cinema_D', 9);

insert into cinema
values(005, 'Cinema_E', 15);


-- MOVIES TABLE
insert into movie
values(101, 'Titanic', 18);

insert into movie
values(102, 'Toy Story', NULL);

insert into movie
values(103, 'Kill Bill', 22);

insert into movie
values(104, 'Cars', NULL);

insert into movie
values(105, 'Harry Potter I', 12);

insert into movie
values(106, 'Pulp Fiction', 22);

insert into movie
values(107, 'Matrix', 18);

-- BILLBOARD table

insert into billboard
values(1,101);

insert into billboard
values(1,105);

insert into billboard
values(1,103);

insert into billboard
values(2,102);

insert into billboard
values(5,103);

insert into billboard
values(4,105);

insert into billboard
values(5,101);

insert into billboard
values(2,105);

insert into billboard
values(1,103);

insert into billboard
values(4,103);
