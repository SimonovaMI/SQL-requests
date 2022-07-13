
CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2);

select * from locations2;

select * from locations;

insert into locations2 (select * from locations where country_id = 'IT');

commit;

insert into locations2 VALUES (7000, '2000 France', null, INITCAP('Paris'), initcap('France'), upper('FR'));
commit;

insert into locations2 (select * from locations where length(state_province) > 9);

commit;

insert all
when 1=1 then into locations2 values (location_id, street_address,postal_code,city,state_province,country_id)
when region_name = 'Europe' then into locations4europe values (location_id, street_address,null,
city,null,country_id)
select locations.*, region_name from locations join countries on (locations.country_id = countries.country_id)
join regions on (countries.region_id = regions.region_id);
commit;

update locations2 set postal_code = '354' where postal_code is null;

rollback;

update locations2 set postal_code = (select postal_code from locations where location_id = 2600)
where postal_code is null;
commit;

delete from locations2 where country_id = 'IT';
select * from locations2;
savepoint delete_IT;

update locations2 set street_address = 'Sezam st. 18' where location_id > 2500;

savepoint update_street_address;

delete from locations2 where street_address = 'Sezam st. 18';

rollback to savepoint delete_IT;




