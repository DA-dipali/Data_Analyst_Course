/* 3/05/23
string functions
*/
use scott;
select lower('RENU');
select upper('renu');
select right('RENU',1);
select right('RENU',2);
select left('RENU',1);
select left('RENU',2);
#substr('input_data',+/- start printing from this position, [+no. of characters to be printed])| MID() | SUBSTRING()
select substr('Renu Nair',1,1);
select substr('Renu Nair',2,1);
select substr('Renu Nair',7,3); #air
select substr('Renu Nair',1);
select substr('Renu Nair',-1,1);#r
select substr(ename,1,2) as name, ename from emp;
select substr('Renu Nair',6,10); #? will check for rest characters n print spaces
select substr('Renu Nair',-2,3);#[+no. of characters to be printed]=> always counts rightside from character
select substr('smith',-1,1); #h more appropriate
select substr('smith',5,1); #h
select length(length('renu')); #nesting of functions --> length(4) --> 1
#DIPALI --> dipali --> Dipali
select concat(upper(substr('dipali',1,1)),lower(right('dipali',5))) as proper;#1
select concat(upper(substr('dipali',1,1)),lower(substr('dipali',2,5))) as proper;#2
select concat(upper(substr(ename,1,1)),lower(substr(ename,2,5))) as proper from emp;
select length(substr('renu',4,4)) as name;
select instr('renu','r');#shows position in string
select instr('I am renu', 'am');
select instr('parinita', 'a'); #IT IS POSSIBLE IN ORACLE DB, BUT NOT IN MY SQL. THEY MAY UPGRADE THIS IN FUTURE. In ORACLE DB, instr('RENU NAIR','R',1,2);
#renu nair --> nair
select instr('renu nair',' ')+1;
select substr('renu nair',instr('renu nair',' ')+1);
select left(substr('allen scott',7),1);
/*
Home task:
1) display those employees whos name start with j and end with s(without using like)
2) display those employees whos name do not contain 's' (using instr only)
*/
select substr('renu nair',1, instr('renu nair',' ')-1) as name;
##########################################################################

select now(); #date time
select current_date();
select current_time();
select month(now());
select year(now());
select day(now());
select dayname(now());
select monthname(now());
select ename, hiredate from emp;
select * from emp
where dayname(hiredate)='friday';
select * from emp where month(hiredate) =12;
select * from emp where year(hiredate) = 1981;
select date_add(current_date, interval 1 day);
select date_add(current_date, interval 1 month);
select date_add(current_date, interval 1 year);