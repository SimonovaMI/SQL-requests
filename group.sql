select department_id, min(salary), max(salary), min(hire_date), max(hire_date), count(*) as c 
from employees group by(department_id) order by c desc;

select distinct substr(first_name, 1, 1), count(*) from employees group by substr(first_name, 1, 1) having count(*) > 1 order by count(*) desc;

select department_id, salary, count(*) from employees group by(department_id,salary) order by department_id;

select first_name, salary from employees where department_id = 50 and salary = 2500;

select to_char(hire_date,'dy'), count(*) from employees group by to_char(hire_date,'dy');

select department_id, count(*)
from employees 
group by department_id 
having count(*) > 30 and sum(salary) > 300000;

select region_id from countries group by region_id having sum(length(country_name)) > 50;

select job_id, avg(round(salary)) from employees group by job_id;

select department_id from employees group by department_id having count(distinct job_id) > 1;

select department_id, job_id, max(salary), min(salary) 
from employees 
group by department_id, job_id 
having avg(salary) >10000 order by department_id;

select manager_id from employees where commission_pct is null 
group by manager_id 
having min(salary) > 6000 and max(salary) < 9000
order by manager_id;

select round(max(avg(salary)), -3) from employees group by department_id;