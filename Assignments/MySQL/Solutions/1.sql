use assignment;   
create table countries(name char(22),population int,capital char(22));    #3
show tables;
desc countries;
insert into countries values('China',1382,'Beijing'),('India',1326,'Delhi'),('United States',324,'Washington D.C.'),('Indonesia',260,'Jakarta'),('Brazil',209,'Brasilia');
insert into countries values('Pakistan',193,'Islamabad'),('Nigeria',187,'Abuja'),('Bangladesh',163,'Dhaka'),('Russia',143,'Moscow'),('Mexico',128,'Mexico City'),('Japan',126,'Tokyo'),('Philippines',102,'Manila'),('Ethiopia',101,'Addis Ababa');
insert into countries values('Vietnam',94,'Hanoi'),('Egypt',93,'Cairo'),('Germany',81,'Berlin'),('Iran',80,'Tehran'),('Turkey',79,'Ankara'),('Japan',126,'Tokyo'),('Congo',79,'Kinshasa'),('France',64,'Paris'),('United Kingdom',65,'London');
insert into countries values('Italy',60,'Rome'),('South Africa',55,'Pretoria'),('Myanmar',54,'Naypyidaw');        #3a
insert into countries values('Bhutan',890,'Thimphu'),('Canada',569,'Ottawa'),('Cuba',67,'Havana');           #3b
select * from countries;
update countries set capital='New Delhi' where name='India';          #3c
rename table countries to big_countries;      #4

create table suppliers
(
supplier_id int primary key auto_increment,
supplier_name char(22),
location char(22)
);                      #5b Parent
alter table suppliers
auto_increment=10;
insert into suppliers values(10,'John','Solapur');           #6
insert into suppliers values(11,'Ram','Nagpur');
select * from suppliers;     #to display all the columns only once
show tables;

create table product
(
product_id int primary key auto_increment,
product_name char(22) not null,
supplier_no int,
foreign key (supplier_no) references suppliers(supplier_id) on delete CASCADE on update set NULL
);                       #5a
alter table product
auto_increment=100;
insert into product values(100,'Stationary',10);      #6
insert into product values(101,'Book',11);
select * from product;

create table stock
(
stock_id int primary key auto_increment,
stock_no int,
balance_stock int,
foreign key (stock_no) references product(product_id) on delete CASCADE on update set NULL
);             #5c
alter table stock
auto_increment=21;
desc stock;
insert into stock values(21,100,256);               #6
insert into stock values(22,101,300);
select * from stock;

ALTER table suppliers
modify supplier_name char(22) not null unique; #7

/*ALTER table emp
DROP COLUMN deptno; */

ALTER table emp
add column deptno int; #8a

desc emp; #8b
UPDATE emp
  SET deptno = 
    case
        when emp_no % 2 = 0 THEN 20
        when emp_no % 3 = 0 THEN 30
        when emp_no % 4 = 0 THEN 40
        when emp_no % 5 = 0 THEN 50
	 ELSE  10
  END;
select * from emp;
 
# DROP INDEX EMP_NO_UNIQ ON emp;

CREATE UNIQUE INDEX EMP_NO_UNIQ #9
ON emp(emp_no);

CREATE VIEW emp_sal as #10
select emp_no, CONCAT(first_name,' ',last_name) as Employee, salary from emp
order by salary desc;
select * from emp_sal;
