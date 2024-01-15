use scott; #4/05/23
/*
2023-04-04 --> yyyy-mm-dd
04
april
apr
*/
insert into emp(empno,ename,hiredate) values(1234,'Alex', str_to_date('20-mar-2022','%d-%b-%Y'));
select date_format(now(),'%Y');#4 digits of year
select date_format(now(),'%M');#month name
select date_format(now(),'%m');#digit for a month
select date_format(now(),'%D'); #16th date format
select date_format(now(),'%d'); #no of day wrt month
select date_format(now(),'%W'); #dayname
select date_format(now(),'%w'); #day no of week
select date_format(now(),'%H'); #24 hour
select date_format(now(),'%h'); #12 hour
select date_format(now(),'%a'); #3 letter abrevation of week day name
select date_format(now(),'%b'); #3 letter abv of month
select timestampdiff(year,'2023-03-01','2023-03-01'); #date datetime hour minute
select timestampdiff(month,'2023-03-01','2023-03-01');
select timestampdiff(day,'2023-03-01','2023-03-01');
/*
66.4% ---> whole no ---> 66

65.7 --> 66

54.5 -->55

round

range

5-9 --> +1
0-4 --> +0
*/

select round(1234.5467,2);
select round(1234.5467,1);
select round(1234.5467,0);
select truncate(1234.5467,2);
select truncate(1234.5467,0);
select mod(2,2),2%2; # Modulas Operator : Gives us the remainder
select mod(13,2),13%2;
select mod(13,2);#u can use mod or % only
/*
Agregate Functions| Group Functions| Multirow Functions
sum(), max(), min(), avg(), count()
*/
select * from emp;
select min(sal) from emp; -- 1 value --> 16 rows are one set
select max(sal) from emp;
select min(hiredate), max(hiredate) from emp;
select min(sal), ename from emp; #not allowed, both columns dont relate to each other. u r projecting it.
select sum(sal), avg(sal) from emp;
select count(ename) from emp;
select count(*) from emp;
select comm from emp;
select count(comm) from emp; #group function ignores null values
select count(distinct deptno) from emp;
select min(sal),deptno from emp
group by deptno;

#total people working in each job
select count(empno), job
from emp
group by job;

select max(min(sal)) from emp group by deptno; #nesting of group function is not allowed(will work in other DB soft. like oracle, ms sql server)

#Job where total no of employee more than 3
select count(empno), job
from emp
where count(empno)>3 # We can't give condition to group function i.e.count(empno)
group by job;

/*
BOX --> Balls(Green, Red, Blue) ---> Green N Blue --> 10
Select count (Balls) --->4
from box --->1
where color in('G','R') ---> 2
Group by color ---> 3
having count (balls)>10 --->5
*/

select count(empno), job
from emp
group by job  # We can use HAVING
having count(empno)>3;

#how many clerk and managers
select count(empno), job
from emp
where job in('clerk','manager') #u can impose condition only to simple columns i.e. job
group by job;

# Sales in each day --> days where total sales reached 100000
#sales_info --> table, Sales_date, sales --> columns

select sum(sales)
from sales_info
group by dayname(sales_date)
having sum(sales)>100000;

# Find the total income of department 10 and 20 but display only that department where the total is more than 9600 --> Homework
select sum(sal),deptno from emp
where deptno in(10,20)
group by deptno
having sum(sal)>9600;

# where --> normal column
# having -->agg_function(col1)

select avg(sal),job from emp
where job in('manager','analyst')
group by job
having avg(sal)>2990;

#delete from emp where deptno is null


