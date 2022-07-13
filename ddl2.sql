create table emp1000 as select first_name, last_name, salary, department_id from employees;

select * from emp1000;

select * from departments;

create view v1000 as select first_name, last_name, salary, department_name, city 
from employees join departments on (employees.department_id = departments.department_id)
join locations on (departments.location_id = locations.location_id);

select * from v1000;

alter table emp1000 add (city varchar2(30));

alter view v1000 compile;

create synonym syn1000 for v1000;

select * from syn1000;

drop view v1000;

drop SYNONYM syn1000;

drop table emp1000;

create SEQUENCE seq1000 start with 12;

alter SEQUENCE seq1000 increment by 4;

alter SEQUENCE seq1000 MAXVALUE 200;

alter SEQUENCE seq1000 CYCLE;

select seq1000.currVal from dual;

select seq1000.nextVal from dual;

alter SEQUENCE seq1000 NOCYCLE;

alter SEQUENCE seq1000 NOMAXVALUE; 

drop SEQUENCE seq1000;

select * from jobs;

insert into employees (employee_id, last_name, email,hire_date,job_id) 
values (SEQ1000.nextval, 'Simonova', 'si',TO_DATE('01.01.2009', 'dd.mm.yyyy'), 'AD_PRES');

select * from employees where last_name = 'Simonova';
commit;

create SEQUENCE seq start with 12
MAXVALUE 100
increment by 12;

select seq.nextVal from dual;

drop SEQUENCE seq;

create table test200 (
id integer,
name1 varchar2(10), 
name2 varchar2(10),
address1 varchar2(10), 
address2 varchar2(10)
);

insert into test200 values (1, 'q', 't', 'dd', 'fjh');

update test200 set &column = &value where id = &id_value;

select * from test200 where name1 = &&name and
name2 = &name
AND address1 = &&address and
address2 = &address;

undefine name;
undefine address;


