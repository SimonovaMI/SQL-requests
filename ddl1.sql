create table address(
id integer constraint ad_id_un unique,
country varchar2(15),
city varchar2(15)
);

select * from address;

create table friends(
id integer , 
name varchar2(15), 
email varchar2(15),
address_id integer constraint adr_id_ref references address(id) on delete set null, 
birthday date,
constraint name_check check (length(name) > 3)
);

create unique index un_id on friends(id);

alter table friends add constraint fr_id_pk primary key (id);

create index fr_email_in on friends(email);

alter table friends modify (email constraint fr_email_nn not null);

drop table friends;

drop table address;