use assignment;
desc employee;
select * from students;
select * from employee;
SELECT empid,CONCAT(fname,' ',lname) as Ename,deptno, salary from employee where deptno=10 and salary>3000;      #1

select *,      #2
	CASE
      WHEN marks BETWEEN 40 AND 50 THEN 'Third Class'
	  WHEN marks BETWEEN 50 AND 60 THEN 'Second Class'
	  WHEN marks BETWEEN 60 AND 80 THEN 'First Class'
	  WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
	ELSE 'Failed'
END as Grade from students;

select * from (select *,          # students with first class
		       CASE
			      WHEN marks BETWEEN 40 AND 50 THEN 'Third Class'
			      WHEN marks BETWEEN 50 AND 60 THEN 'Second Class'
			      WHEN marks BETWEEN 60 AND 80 THEN 'First Class'
			      WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
			   ELSE 'Failed'
END as Grade From students) as fcount
where fcount.Grade = 'First Class';

Select count(*) 'First-class Students' from students where marks between 60 and 80;       #a

select * from (select *,          # students with Distinctions
		       CASE
			      WHEN marks BETWEEN 40 AND 50 THEN 'Third Class'
			      WHEN marks BETWEEN 50 AND 60 THEN 'Second Class'
			      WHEN marks BETWEEN 60 AND 80 THEN 'First Class'
			      WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
			   ELSE 'Failed'
END as Grade From students) as fcount
where fcount.Grade = 'Distinction';

Select count(*) 'No. of Distinction Students' from students where marks between 80 and 100;       #b

Desc station;
SELECT DISTINCT CITY, ID        #3
FROM STATION
WHERE MOD(ID, 2) = 0;

select (count(CITY)- count(DISTINCT CITY)) from STATION;      #4

SELECT DISTINCT(CITY)       #5a
FROM STATION 
WHERE LEFT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U');

/* Or (5a)
1. Using Regular expression
SELECT DISTINCT(CITY)
FROM STATION 
WHERE CITY REGEXP '^[aeiou]';

Or
2. Using substring
SELECT DISTINCT(CITY)
FROM STATION 
WHERE SUBSTR(CITY, 1, 1) IN ('A', 'E', 'I', 'O', 'U');

Or
3. Using OR
SELECT DISTINCT(CITY)
FROM STATION 
WHERE (CITY LIKE "A%") 
    OR (CITY LIKE "E%")
    OR (CITY LIKE "I%")
    OR (CITY LIKE "O%")
    OR (CITY LIKE "U%");
*/

SELECT DISTINCT(CITY)      #5b
FROM STATION 
WHERE LEFT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U') and RIGHT(CITY,1) IN ('A', 'E', 'I', 'O', 'U');

SELECT DISTINCT CITY FROM STATION WHERE SUBSTR(CITY,1,1) NOT IN ('A', 'E', 'I', 'O', 'U');     #5c

SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) OR RIGHT(CITY,1) NOT IN ('A', 'E', 'I', 'O', 'U');      #5d

DESC Emp;

SELECT * FROM EMP;
SELECT first_name, salary FROM Emp      #6
WHERE Salary > 2000
AND DATE_SUB(DATE(NOW()), INTERVAL 36 MONTH) < HIRE_DATE
ORDER BY salary ASC;

DESC employee;
SELECT deptno, SUM(SALARY) AS Total_Salary       #7
FROM EMPLOYEE 
GROUP BY deptno;

DESC CITY;
SELECT count(name) from CITY where population > 100000;       #8

SELECT SUM(POPULATION)        #9
FROM CITY
WHERE DISTRICT = 'California';

SELECT * FROM CITY;          #10
SELECT COUNTRYCODE, AVG(POPULATION) AS AVG_POPULATION
FROM CITY
WHERE COUNTRYCODE IN('JPN','NLD','USA')
GROUP BY COUNTRYCODE;

SELECT * FROM ORDERS;          #11
SELECT * FROM CUSTOMERS;
select ordernumber as Ord_No, status, customername as Cust_Name, comments
from orders as o join customers as c on(o.customernumber = c.customernumber)
where status = 'Disputed';

