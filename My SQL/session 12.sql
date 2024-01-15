use scott;
create table medicines(med_id int, name char(22), qty int);
insert into medicines values (101, 'CROSIN', 100);
insert into medicines values (102, 'DOLO 650', 100);
select * from medicines;
create table orders(med_id int, order_date datetime);