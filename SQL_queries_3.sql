#Find all the film categories in which there are between 55 and 65 films. 
#Return the names of these categories and the number of films per category, sorted by the number of films.

select c.name, count(fc.category_id) as broj_filmova
from category c
inner join film_category fc on c.category_id = fc.category_id
group by fc.category_id
having broj_filmova
between 55 and 65
order by broj_filmova desc;


#In how many film categories is the average difference between the film replacement cost and the rental rate larger than 17?

select count(category_count)
from (
select film_category.category_id as category_count
from film_category 
inner join film on film.film_id = film_category.film_id
inner join category on category.category_id = film_category.category_id
group by film_category.category_id
having avg(replacement_cost - rental_rate) > 17
) as rezultat;

#Find the address district(s) name(s) such that the minimal postal code in the district(s) is maximal over all the districts. Make sure your query ignores #empty postal codes and district names.

select max(minimum) as max_od_minimuma
from (
    select district, min(postal_code) as minimum
    from address
    where district is not null and district != ""
    group by district
    ) as maxmin;

#Find the names (first and last) of all the actors and costumers whose first name is the same as the first name of the actor with ID 8. Do not return the 
#actor with ID 8 himself. Note that you cannot use the name of the actor with ID 8 as a constant (only the ID). There is more than one way to solve this #question, but you need to provide only one solution.

select izbor.first_name,izbor.last_name 
from (
  select c.first_name,c.last_name 
  from customer c
  union all
  select a.first_name,a.last_name 
  from actor a
  where a.actor_id != 8
) as izbor
  join actor glumac on glumac.first_name = izbor.first_name
where glumac.actor_id = 8;


