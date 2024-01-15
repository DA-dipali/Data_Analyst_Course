/* 
Analytical Functions| Window Functions
*/
select rank() over(order by sal desc) as rank_value, ename, sal from emp;  #4th jones?
select rank() over(partition by deptno order by sal desc) as rank_value, ename, sal, deptno from emp;
#Inline View
select * from
(
select rank() over(partition by deptno order by sal desc) as rank_value, ename, sal, deptno from emp
) t1 where rank_value = 1;

#rank 1
select rank() over(partition by deptno order by ename desc) as rank_value, ename, sal, deptno from emp;

select * from emp where dayname(hiredate)='friday';

#dense rank doesn't skip value
select dense_rank() over (order by sal desc) as rank_value, ename, sal, deptno from emp;
select round(percent_rank() over(order by sal asc),2) as percent_value, ename, sal from emp;
select (2-1)/(14-1); 
#select (rank-1)/(total no of rows - 1);

select row_number() over() ename from emp;

#ranking value in (1,2) means top 2 highly paid in each department
select * from
(
select rank() over(partition by deptno order by sal desc) as rank_value, ename, sal, deptno from emp
) t1 where rank_value in (1,2);