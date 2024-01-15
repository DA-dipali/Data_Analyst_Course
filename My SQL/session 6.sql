use scott; #31/4/23
/*
select ___________from table_name
[where condition(s)];
column_name comparison operator values
=,>=,<=,<,>,<> != --> 1 value

In(set)

Like
% --> Zero or More Characters

_ --> only one character

LOGICAL OPERATORS
AND --> All the conditions must be true
OR --> One condition must be true
NOT
*/
select * from emp where ename IN ('scott','smith');
#display those employees working as clerk and salesman
select * from emp where job IN ('clerk','salesman');
#display the names of employees whose name starts with character 's'
select * from emp where ename Like 's%';
#ends with s
select * from emp where ename Like '%s';
#contains s
select * from emp where ename Like '%s%';
#Display the names of all employees who have atleast two A in their name
select * from emp where ename Like '%A%A%';
#Display those employees whose name contain an I as third letter
select * from emp where ename Like '__i%';
#Display those names of employees who have an e as second last character
select * from emp where ename Like '%e_';
select * from emp where comm=null;
select * from emp where comm is null;
select * from emp where mgr is null;
select ename,sal from emp where sal between 1250 and 3000;
select ename,sal from emp where sal>=1250 and sal<=3000;
#in operators are not allowed in logic operators
#display the details of all employees who work as CLERK and SALESMAN
select * from emp where job='clerk' or job='salesman';
#display the details of all employees who work as CLERK and SALESMAN but display only those who have salary value more than 1000
select * from emp where (job='clerk' and sal>1000) or (job='salesman' and  sal>1000);
#or
select * from emp where (job='clerk' or job='salesman') and sal>1000; #wrong
select * from emp where sal>1000 and job='clerk' or job='salesman'; #precedence of logic operator (), and, or
#display the name of employees whose name doesn't start with s
select ename from emp where ename not Like 's%'; # NOT OPERATOR
select * from emp where ename NOT IN ('scott','smith');
select ename,sal from emp where sal not between 1250 and 3000;
select * from emp where comm is not null;
/*
1)display those employees who were hired in DECEMBER month
2)display those employees who do not get commision
3)display those employees whose name starts with j and ends with s
*/
select * from emp;
select ename, hiredate from emp where  to_char(hiredate,'YYYY-MM-DD')>='yyyy-12-01'; #from net
select * from emp where hiredate like '%-12-%';
select ename, comm from emp where comm=0 or comm is null;
select ename from emp where ename like 'j%s';


/*
case

clerk -->100
salesman -->200
manager -->500
*/
select ename,job,sal as old_salary,
case
when job='clerk' then sal+100
when job='salesman' then sal+200
when job='manager' then sal+500
end as new_salary from emp; #we are getting null in new salary

select ename,job,sal as old_salary,
case
when job='clerk' then sal+100
when job='salesman' then sal+200
when job='manager' then sal+500
else sal end as new_salary from emp; #to avoid null, replace null with old salary

/*
clerks  200
salesman 100
manager 300
president 500
*/
# -->select name sal paid_amt balance_amt

select ename, sal as old_sal,
case
when job='clerk' then 200
when job='salesman' then 100
when job='manager' then 300
when job='president' then 500
else 0 end as paid_amt,
case
when job='clerk' then sal-200
when job='salesman' then sal-100
when job='manager' then sal-300
when job='president' then sal-500
else sal end as balance_amt,job from emp;


