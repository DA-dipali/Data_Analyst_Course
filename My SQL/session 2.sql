use hr_info; #27/4/23
select * from employees; # to display
create table employees(empno int,name char(22), doj date);
insert into employees values(1,'Deepali','2023-04-24');
insert into employees(name,doj,empno) values('Alex','2012-06-14',2);#different sequence
insert into employees(empno,name) values(4,'Sam');
insert into employees values(5,'Ford',null);
describe employees;#to show columns
insert into employees values(6,'Shubham','2012-03-23'),(7,'Dinesh','2014-07-23');#multiple row insertion
update employees set name='Alexa' where empno=1;
update employees set doj=current_date where empno>3;#multiple rows
update employess set name='Deepali';#all rows
select * from employees;
delete from employess where empno=1;
delete from employees where empno>5;
delete from employees;
insert into employees values(1,'Deepali','2023-04-24'); 
select * from employees;
#auto commit is enabled in mysql
rollback;

set autocommit=0;#autocommit is disabled in mysql
insert into employees values(2,'Alex','2023-05-24');
commit;
insert into employees values(3,'Sam','2023-06-24');
rollback;
####################################################################################
/* 29/04/23
rules on data -->constraints -->Insert Update Delete
UNIQUE
NOT NULL -->CAN'T BE EMPTY
PRIMARY KEY (U+NN)
CHECK(CONDITION) -->CHECK (SALARY>0)
FOREIGN KEY |REFERENTIAL INTEGRITY CONSTRAINT
delete
on delete set null: whenever a parent row is deleted the associated child VALUE is set to null
on delete cascade : whenever a parent row is deleted the associated child ROW is set to null
UPDATE
on update cascade : whenever a parent VALUE is deleted the associated child VALUE is set to the NEW VALUE (automatic)
on update set null : whenever a parent VALUE is updated the associated child VALUE is set null (manual)
*/
Show tables; -- collection of tables
drop table employees;
create table department(deptno int primary key, dname char(22) not null unique);#Parent
insert into department values(10,'sales');
insert into department values(20,'research');
select * from department; #to display all the columns only once
show tables;
# Child
create table employees
(
empno int primary key,
name char(22) not null,
salary int not null check(salary>0),
deptid int,
foreign key (deptid) references department(deptno) on delete set NULL on update CASCADE
);

insert into employees values(101,'Renu',1000,10);
insert into employees values(102,'Sam',2000,20);
insert into employees values(103,'Allen',3000,10);
select * from employees;
delete from department where deptno=10;
update department set deptno=55 where deptno=20;
select * from department;
#update employees set deptno=55 where deptno=20;
show tables;
commit;

######################################### on delete cascade/on update set null#################################
drop table employees; #29/05/23
drop table department;
create table department(deptno int primary key, dname char(22) not null unique);#Parent
insert into department values(10,'sales');
insert into department values(20,'research');
insert into department values(30,'hr');
select * from department;

create table employees
(
empno int primary key,
name char(22) not null,
salary int not null check(salary>0),
deptid int,
foreign key (deptid) references department(deptno) on delete CASCADE on update set NULL
);

insert into employees values(101,'Renu',1000,55);
insert into employees values(102,'Sam',2000,20);
insert into employees values(103,'Allen',3000,55);
select * from employees;
delete from department where deptno=55;
update department set deptno=33 where deptno=20;





