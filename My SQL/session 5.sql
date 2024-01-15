/*
DQL (DATA QUERY LANGUAGE)
SELECT -- > TO DISPLAY
*/
drop database scott;
select * from emp;
select ename,job from emp;
#display the name salary and hire date of employees
select ename, sal, hiredate from emp;
#display the name and annual salary of all the employees
select ename,sal*12 from emp;
/*
* + - /
*/
#display the name and annual salary of all employees after deducting 100 only once
select ename, (sal*12)-100 from emp;
#display the name and annual salary of all employees after deducting 100 every month
select ename, (sal-100)*12 from emp;
select ename, sal, comm, sal+comm from emp;
select ename, comm, ifnull(comm,0)+sal from emp;
select ename, ifnull(mgr,'No Manager') from emp;
select ename as name,sal*12 as annual_salary from emp;
select empno as ID, ename as Name, job as Job_role from emp; 
select ename as Name,sal as Salary, comm, ifnull(comm,0)+sal as "Annual Salary" from emp;
select 'RENU' as Name;
#NAME JOBROLE, 200, BALANCE AMT
select ename, job, sal, 200 as paid_amt, sal-200 as balance_amt from emp;
select distinct deptno from emp;
select distinct deptno, job from emp;
/*
SELECT [DISTINCT] *, COLUMN_NAME[[AS] ALIAS],....FROM TABLE_NAME;
*/