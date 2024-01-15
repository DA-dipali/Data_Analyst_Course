/*
TCL (transaction control language) -->DML'savepoint
ROLLBACK --> UNDO
COMMIT --> SAVE
SAVEPOINT
*/
use hr_info;insert into employees values(1,'renu','2023-03-24');#commited
select * from employees;
#autocommit is enabled in mysql
rollback;
set autocommit=0; #disabled the autocommit -->session specific
insert into employees values (2,'alex','2023-03-24');
commit;
insert into employees values (3,'sam',null);
rollback; -- till the last commit
update employees set job=null;
commit;
delete from employees;
rollback;
commit;
select * from employees;
insert into employees values (4,'alex',null);
savepoint a1;
insert into employees values (5,'alex',null);
savepoint a2;
insert into employees values (6,'alex',null);
savepoint a3;
insert into employees values (7,'alex',null);
savepoint a4;
select *from employees;
delete from employees;
rollback to savepoint a4;
rollback to savepoint a3;
rollback to savepoint a1;
rollback to savepoint a2;#this action couldn't be executed as we already rollbacked to a4 then data after that also get deleted
rollback;
select * from employees;
delete from employees;
rollback;
truncate table employees;#removed all the rows, it is a ddl command
rollback;
#truncate vs delete

##########################################################################################
/*
rules on data -->CONSTRAINTS --> Insert Update Delete
UNIQUE
NOT NULL -->CAN'T BE EMPTY
PRIMARY KEY (U+NN)  NN-NOT NULL
CHECK (CONDITION)  -->CHECK (SALARY>0)
FOREIGN KEY |REFERENTIAL INTEGRITY CONSTRAINT
*/
create