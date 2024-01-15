use scott;
desc emp;
#tell me the names of those employees who earn same salary value
select t1.ename, t1.sal from emp t1 join emp t2 on (t1.sal=t2.sal) and (t1.empno<> t2.empno);

#find the emp who earn 1250
select t1.ename, t1.sal from emp t1 join emp t2
on (t1.sal=t2.sal) and (t1.empno<> t2.empno)
where t2.sal=1250;
from product left outer join sales; #join excel tables(1)
from sales right outer join product

select pname from products join sales on(Pid=Pid) join return on (Pid =Rpid)