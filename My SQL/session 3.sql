use hr_info; #homework
create table worker(empno int, name char(22), job char(22));
show tables;
desc worker;
insert into worker values(1,'Deepali','Data analyst');
insert into worker values(2,'Sagar','Director');
insert into worker values(3,'Vikas','Builder');
insert into worker values(4,'Harish', 'Executive');
insert into worker values(5,'Shridevi','Telecaller');
update worker set job=null; #method 1
delete values from worker column job; #method 2