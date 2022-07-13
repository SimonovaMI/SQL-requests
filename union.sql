select manager_id, to_char(null), to_number('0'), sum(salary) from employees group by manager_id
union all
select to_number(0), job_id, to_number('0'), sum(salary) from employees group by job_id
union all
select to_number(0), to_char(null), department_id, sum(salary) from employees group by department_id;

select department_id from employees where employee_id = 100
minus
select department_id from employees where employee_id = 145 or employee_id = 201;

select first_name, last_name, salary from employees where first_name like '_a%'
INTERSECT
select first_name, last_name, salary from employees where lower(last_name) like '%s%'
order by salary desc;

select location_id, postal_code, city 
from locations where country_id in (select country_id from countries where country_name = 'Italy')
union all
select location_id, postal_code, city 
from locations where country_id in (select country_id from countries where country_name = 'Germany')
union 
select location_id, postal_code, city 
from locations where postal_code like '%9%';


select country_id id, country_name country, region_name region from countries join regions using(region_id) where length(country_name) > 8 
union
select country_id id, country_name country, region_name region from countries join regions using(region_id) where region_name != 'Europe'
order by 2 desc;

