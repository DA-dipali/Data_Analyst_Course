use scott; 5/5/23
/*
JOIN --> to display data coming from multiple tables
types of Join : for joins to implement pk n fk are not always required
Inner --> common data| only those rows which satisfies given join condition
Outer --> not matching nos.|common rows as well as not matching rows
left [outer] 
right [outer]
full [outer]
Left
Right
full
cross
self
*/
# CMD
select ename as name,dname,loc from emp as e join dept as d on(d.deptno=e.deptno);
select * from emp;
select * from salgrade;
select ename,grade from emp join salgrade on sal between losal and hisal;
select e.ename,s.grade from emp e inner join salgrade s on e.sal between s.losal and s.hisal;

#display that dept name where no employees are working
select ename,dname from emp e join dept d on(e.deptno<>d.deptno);

select ename,dname from emp e outer join dept d on(e.deptno=d.deptno);#not defined type of outer join

select ename,dname from emp e right outer join dept d on(e.deptno=d.deptno);
select ename,dname from emp e left outer join dept d on(e.deptno=d.deptno);#display that emp who is not working
select ename,dname from emp e left outer join dept d on(e.deptno=d.deptno) where dname is null;
select ename,dname from emp e right outer join dept d on(e.deptno=d.deptno) where ename is null;#not matching row

/*
Set -->union, intersection, minus, union all
union
A={1,2,3,4}
B={2,4,6}
A U B ={1,2,3,4,6}
A Union All B={1,2,3,4,2,4,6}
*/

select Deptno from emp
union
select deptno from dept;

select ename,dname from emp e left outer join dept d on(e.deptno=d.deptno)
union
select ename,dname from emp e right outer join dept d on(e.deptno=d.deptno);

select dname from dept;
select dname, ename from emp cross join dept;#cartesian product i.e. ab*a=aa*ba

create table customers(cust_id int, cname char(22), city char(22));
insert into customers values (1,'King','Boston');
insert into customers values (2,'Ben','Seattle');
insert into customers values (3,'Alex','Boston');
insert into customers values (2,'Ben','Seattle');
select * from customers;
select t1.cname,t1.city from customers t1 inner join customers t2 on (t1.city=t2.city) and t1.cust_id<>t2.cust_id;#self join
select t1.*,t2.* from emp t1 cross join emp t2;
/*
mysql> use scott;
Database changed
mysql> select * from emp;
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000 | NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1980-09-08 | 1500 |    0 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
|  1234 | Alex   | NULL      | NULL | 2022-03-20 | NULL | NULL |   NULL |
|  1234 | Alex   | NULL      | NULL | 2022-03-20 | NULL | NULL |   NULL |
+-------+--------+-----------+------+------------+------+------+--------+
16 rows in set (0.04 sec)

mysql> select * from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.26 sec)

mysql> select ename as name,dname,loc from emp as e join dept as d on(d.deptno=e.deptno);
+--------+------------+----------+
| name   | dname      | loc      |
+--------+------------+----------+
| SMITH  | RESEARCH   | DALLAS   |
| ALLEN  | SALES      | CHICAGO  |
| WARD   | SALES      | CHICAGO  |
| JONES  | RESEARCH   | DALLAS   |
| MARTIN | SALES      | CHICAGO  |
| BLAKE  | SALES      | CHICAGO  |
| CLARK  | ACCOUNTING | NEW YORK |
| SCOTT  | RESEARCH   | DALLAS   |
| KING   | ACCOUNTING | NEW YORK |
| TURNER | SALES      | CHICAGO  |
| ADAMS  | RESEARCH   | DALLAS   |
| JAMES  | SALES      | CHICAGO  |
| FORD   | RESEARCH   | DALLAS   |
| MILLER | ACCOUNTING | NEW YORK |
+--------+------------+----------+
14 rows in set (0.00 sec)

mysql> select * from emp;
+-------+--------+-----------+------+------------+------+------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL  | COMM | DEPTNO |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000 | NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1980-09-08 | 1500 |    0 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
|  1234 | Alex   | NULL      | NULL | 2022-03-20 | NULL | NULL |   NULL |
|  1234 | Alex   | NULL      | NULL | 2022-03-20 | NULL | NULL |   NULL |
+-------+--------+-----------+------+------------+------+------+--------+
16 rows in set (0.00 sec)

mysql> select * from salgrade;
+-------+-------+-------+
| GRADE | LOSAL | HISAL |
+-------+-------+-------+
|     1 |   700 |  1200 |
|     2 |  1201 |  1400 |
|     3 |  1401 |  2000 |
|     4 |  2001 |  3000 |
|     5 |  3001 |  9999 |
+-------+-------+-------+
5 rows in set (0.07 sec)

mysql> select ename,grade from emp join salgrade on sal between losal and hisal;
+--------+-------+
| ename  | grade |
+--------+-------+
| SMITH  |     1 |
| ALLEN  |     3 |
| WARD   |     2 |
| JONES  |     4 |
| MARTIN |     2 |
| BLAKE  |     4 |
| CLARK  |     4 |
| SCOTT  |     4 |
| KING   |     5 |
| TURNER |     3 |
| ADAMS  |     1 |
| JAMES  |     1 |
| FORD   |     4 |
| MILLER |     2 |
+--------+-------+
14 rows in set (0.02 sec)

mysql> select e.ename,s.grade from emp e inner join salgrade s on e.sal between s.losal and s.hisal;
+--------+-------+
| ename  | grade |
+--------+-------+
| SMITH  |     1 |
| ALLEN  |     3 |
| WARD   |     2 |
| JONES  |     4 |
| MARTIN |     2 |
| BLAKE  |     4 |
| CLARK  |     4 |
| SCOTT  |     4 |
| KING   |     5 |
| TURNER |     3 |
| ADAMS  |     1 |
| JAMES  |     1 |
| FORD   |     4 |
| MILLER |     2 |
+--------+-------+
14 rows in set (0.00 sec)

mysql> #display that dept name where no employees are working
mysql> select ename,dname from emp e join dept d on(e.deptno<>d.deptno);
+--------+------------+
| ename  | dname      |
+--------+------------+
| SMITH  | OPERATIONS |
| SMITH  | SALES      |
| SMITH  | ACCOUNTING |
| ALLEN  | OPERATIONS |
| ALLEN  | RESEARCH   |
| ALLEN  | ACCOUNTING |
| WARD   | OPERATIONS |
| WARD   | RESEARCH   |
| WARD   | ACCOUNTING |
| JONES  | OPERATIONS |
| JONES  | SALES      |
| JONES  | ACCOUNTING |
| MARTIN | OPERATIONS |
| MARTIN | RESEARCH   |
| MARTIN | ACCOUNTING |
| BLAKE  | OPERATIONS |
| BLAKE  | RESEARCH   |
| BLAKE  | ACCOUNTING |
| CLARK  | OPERATIONS |
| CLARK  | SALES      |
| CLARK  | RESEARCH   |
| SCOTT  | OPERATIONS |
| SCOTT  | SALES      |
| SCOTT  | ACCOUNTING |
| KING   | OPERATIONS |
| KING   | SALES      |
| KING   | RESEARCH   |
| TURNER | OPERATIONS |
| TURNER | RESEARCH   |
| TURNER | ACCOUNTING |
| ADAMS  | OPERATIONS |
| ADAMS  | SALES      |
| ADAMS  | ACCOUNTING |
| JAMES  | OPERATIONS |
| JAMES  | RESEARCH   |
| JAMES  | ACCOUNTING |
| FORD   | OPERATIONS |
| FORD   | SALES      |
| FORD   | ACCOUNTING |
| MILLER | OPERATIONS |
| MILLER | SALES      |
| MILLER | RESEARCH   |
+--------+------------+
42 rows in set (0.00 sec)

mysql> select ename,dname from emp e outer join dept d on(e.deptno=d.deptno);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'outer join dept d on(e.deptno=d.deptno)' at line 1
mysql>
mysql>
mysql>
mysql> select ename,dname from emp e right outer join dept d on(e.deptno=d.deptno);
+--------+------------+
| ename  | dname      |
+--------+------------+
| MILLER | ACCOUNTING |
| KING   | ACCOUNTING |
| CLARK  | ACCOUNTING |
| FORD   | RESEARCH   |
| ADAMS  | RESEARCH   |
| SCOTT  | RESEARCH   |
| JONES  | RESEARCH   |
| SMITH  | RESEARCH   |
| JAMES  | SALES      |
| TURNER | SALES      |
| BLAKE  | SALES      |
| MARTIN | SALES      |
| WARD   | SALES      |
| ALLEN  | SALES      |
| NULL   | OPERATIONS |
+--------+------------+
15 rows in set (0.00 sec)

mysql> ^C
mysql> select ename,dname from emp e left outer join dept d on(e.deptno=d.deptno);#display that emp who is not working
+--------+------------+
| ename  | dname      |
+--------+------------+
| SMITH  | RESEARCH   |
| ALLEN  | SALES      |
| WARD   | SALES      |
| JONES  | RESEARCH   |
| MARTIN | SALES      |
| BLAKE  | SALES      |
| CLARK  | ACCOUNTING |
| SCOTT  | RESEARCH   |
| KING   | ACCOUNTING |
| TURNER | SALES      |
| ADAMS  | RESEARCH   |
| JAMES  | SALES      |
| FORD   | RESEARCH   |
| MILLER | ACCOUNTING |
| Alex   | NULL       |
| Alex   | NULL       |
+--------+------------+
16 rows in set (0.00 sec)

mysql> use world;
ERROR 1049 (42000): Unknown database 'world'
mysql> select ename,dname from emp e left outer join dept d on(e.deptno=d.deptno) where ename is null;#not matching row
Empty set (0.00 sec)

mysql> select ename,dname from emp e right outer join dept d on(e.deptno=d.deptno) where ename is null;#not matching row
+-------+------------+
| ename | dname      |
+-------+------------+
| NULL  | OPERATIONS |
+-------+------------+
1 row in set (0.00 sec)

mysql> c^C
mysql> select ename,dname from emp e right outer join dept d on(e.deptno=d.deptno) where ename is null;#not matching row
+-------+------------+
| ename | dname      |
+-------+------------+
| NULL  | OPERATIONS |
+-------+------------+
1 row in set (0.00 sec)

mysql> select ename,dname from emp e left outer join dept d on(e.deptno=d.deptno)
    -> union
    -> select ename,dname from emp e right outer join dept d on(e.deptno=d.deptno);
+--------+------------+
| ename  | dname      |
+--------+------------+
| SMITH  | RESEARCH   |
| ALLEN  | SALES      |
| WARD   | SALES      |
| JONES  | RESEARCH   |
| MARTIN | SALES      |
| BLAKE  | SALES      |
| CLARK  | ACCOUNTING |
| SCOTT  | RESEARCH   |
| KING   | ACCOUNTING |
| TURNER | SALES      |
| ADAMS  | RESEARCH   |
| JAMES  | SALES      |
| FORD   | RESEARCH   |
| MILLER | ACCOUNTING |
| Alex   | NULL       |
| NULL   | OPERATIONS |
+--------+------------+
16 rows in set (0.10 sec)

mysql> select dname from dept;
+------------+
| dname      |
+------------+
| ACCOUNTING |
| RESEARCH   |
| SALES      |
| OPERATIONS |
+------------+
4 rows in set (0.00 sec)

mysql> select dname, ename from emp cross join dept;
+------------+--------+
| dname      | ename  |
+------------+--------+
| OPERATIONS | SMITH  |
| SALES      | SMITH  |
| RESEARCH   | SMITH  |
| ACCOUNTING | SMITH  |
| OPERATIONS | ALLEN  |
| SALES      | ALLEN  |
| RESEARCH   | ALLEN  |
| ACCOUNTING | ALLEN  |
| OPERATIONS | WARD   |
| SALES      | WARD   |
| RESEARCH   | WARD   |
| ACCOUNTING | WARD   |
| OPERATIONS | JONES  |
| SALES      | JONES  |
| RESEARCH   | JONES  |
| ACCOUNTING | JONES  |
| OPERATIONS | MARTIN |
| SALES      | MARTIN |
| RESEARCH   | MARTIN |
| ACCOUNTING | MARTIN |
| OPERATIONS | BLAKE  |
| SALES      | BLAKE  |
| RESEARCH   | BLAKE  |
| ACCOUNTING | BLAKE  |
| OPERATIONS | CLARK  |
| SALES      | CLARK  |
| RESEARCH   | CLARK  |
| ACCOUNTING | CLARK  |
| OPERATIONS | SCOTT  |
| SALES      | SCOTT  |
| RESEARCH   | SCOTT  |
| ACCOUNTING | SCOTT  |
| OPERATIONS | KING   |
| SALES      | KING   |
| RESEARCH   | KING   |
| ACCOUNTING | KING   |
| OPERATIONS | TURNER |
| SALES      | TURNER |
| RESEARCH   | TURNER |
| ACCOUNTING | TURNER |
| OPERATIONS | ADAMS  |
| SALES      | ADAMS  |
| RESEARCH   | ADAMS  |
| ACCOUNTING | ADAMS  |
| OPERATIONS | JAMES  |
| SALES      | JAMES  |
| RESEARCH   | JAMES  |
| ACCOUNTING | JAMES  |
| OPERATIONS | FORD   |
| SALES      | FORD   |
| RESEARCH   | FORD   |
| ACCOUNTING | FORD   |
| OPERATIONS | MILLER |
| SALES      | MILLER |
| RESEARCH   | MILLER |
| ACCOUNTING | MILLER |
| OPERATIONS | Alex   |
| SALES      | Alex   |
| RESEARCH   | Alex   |
| ACCOUNTING | Alex   |
| OPERATIONS | Alex   |
| SALES      | Alex   |
| RESEARCH   | Alex   |
| ACCOUNTING | Alex   |
+------------+--------+
64 rows in set (0.00 sec)

mysql>
*/
