create database hr_info;
create database student;
use hr_info; 
create table employees(empno int,name char(22), doj date);
show tables; #To show collection of tables in db
describe employees; #To view the structure of the created table
desc employees;
alter table employees add salary int;
alter table employees add(phone_no int, mail_id char(33));#method1
alter table employees add phone_no int,add mail_id char(33);#method2 (either execute method 1 or method 2)
alter table employees modify empno char(12);#To change the data type of empno
alter table employees modify phone_no char(10),modify mail_id int; #To change the data type of phone_no n mail_id
alter table employees rename column name to ename; #To edit column name to ename
#change empno column to id n doj column to hiredate with one alter
alter table employees rename column empno to id, rename column doj to hiredate;
alter table employees drop column id;
Rename table employees to Emp_info;
Show Tables;
RENAME TABLE Emp_info to New_info;
SHOW TABLES;
DESC Employees;
DROP TABLE New_info;
