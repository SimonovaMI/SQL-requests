select department_id, count(*) from employees group by department_id;
select location_id, count(*) from departments group by location_id;
select country_id, count(*) from locations group by country_id;
select region_id, count(*) from countries group by region_id;

select c.region_id, count(e.employee_id) from countries c
join locations l on (c.country_id = l.country_id)
join departments d on (l.location_id = d.location_id)
join employees e on (e.department_id = d.department_id) group by region_id;

select first_name, last_name, department_name, job_id, street_address, country_name, region_name from employees e
join departments d on (e.department_id = d.department_id)
join locations l on (l.location_id = d.location_id)
join countries c on (c.country_id = l.country_id)
join regions r on (r.region_id = c.region_id);

select e.first_name, e.manager_id, emp.first_name from employees e join employees emp on (e.manager_id = emp.employee_id);

select emp.first_name, count(emp.employee_id) 
from employees e 
join employees emp on (e.manager_id = emp.employee_id) 
group by e.manager_id, emp.first_name having count(emp.employee_id) > 6 order by emp.first_name;

select department_name,count(*) from employees e 
join departments d using (department_id) group by department_name having count(*) > 30;

select department_name from departments d
left outer join employees e on (d.department_id = e.department_id) where first_name is null;


select e.first_name from employees e 
join employees emp on (e.manager_id = emp.employee_id)
where e.hire_date < to_date('01.01.2005', 'dd.mm.yyyy') and emp.hire_date > to_date('01.01.2005', 'dd.mm.yyyy');

select country_name, region_name from countries natural join regions;

select first_name, last_name, salary from employees e 
join jobs j on (e.job_id = j.job_id) where salary < min_salary + 1000;

select first_name, last_name, country_name from employees e 
left outer join departments d using (department_id)
left join locations l using (location_id)
full outer join countries c using (country_id);


select first_name, last_name, country_name from employees e 
cross join countries c;

select region_name, count(*) from regions r, countries c, locations l, departments d, employees e 
where r.region_id = c.region_id and c.country_id = l.country_id and l.location_id = d.location_id 
and d.department_id = e.department_id
group by region_name;

select department_name from employees e ,departments d
where e.department_id(+) = d.department_id and first_name is null; 


 


