Use scott;
create table sample_test(sid int auto_increment primary key, sname char(12));
insert into sample_test (sname) values ('sample A');
select * from sample_test;
insert into sample_test (sname) values ('sample B');

#auto_increment with diff starting value other than 1
create table sample_test2(sid int auto_increment primary key, sname char(12));
alter table sample_test2 auto_increment=101;
insert into sample_test2 (sname) values ('sample A');
select * from sample_test2;
insert into sample_test2 (sname) values ('sample B');
insert into sample_test2  values (104,'sample C'); #Dont do this, as u have already used auto increment.
insert into sample_test2 (sname) values ('sample D'); #will consider previous count n will auto increment
############################################################################################
----  Views are used for reporting, data hiding  ----
/* Types of Views:-
Complex View : Join,aggregate function, group by, distinct --> DML's are not allowed

Simple View : Join,aggregate function, group by, distinct ARE PRESENT --> DML's are allowed
*/
create view dept_info as
select count(empno) as cnt, ifnull(sum(Sal),0) as total, dname
from emp e right outer join dept d on (e.deptno=d.deptno) 
group by dname;
select * from dept_info;
insert into emp(empno,ename,sal,deptno) values (1234,'Alexa',1200,20);

CREATE VIEW EMP_INFO AS
select empno, ename, job, deptno from emp where deptno=10;

select * from emp_info;
insert into emp_info values(1001,'Sam', 'Salesman',10); #yes

insert into emp_info values (1003,'Sana','Salesman',20); #invisible -- stop with check option

alter view EMP_Info as
select empno,ename,job,deptno from emp where deptno=10
with check option; #only sql

insert into emp_info values (1004, 'San','Salesman',20); #error

select * from emp_info;

CREATE or Replace VIEW EMP_INFO AS 
Select empno,ename,job,hiredate,deptno from emp where deptno=10 with check option; #adding hiredate column into existing emp_info

create table test (id int, name char(12) check (length(name)=10));

insert into test values(1,'renu nair aa');















