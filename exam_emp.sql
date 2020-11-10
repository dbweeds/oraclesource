create table exam_emp as select * from emp where 1<>1;
select * from exam_emp;
delete exam_emp;
insert into exam_emp 
values(7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,null,50);
insert into exam_emp 
values(7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,null,50);
insert into exam_emp 
values(7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,null,60);
insert into exam_emp 
values(7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,300,60);
insert into exam_emp 
values(7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600,null,70);
insert into exam_emp 
values(7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,null,70);
insert into exam_emp 
values(7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,null,80);
insert into exam_emp 
values(7208,'TEST_USER8','STUDENT',7201,'2018-03-09',1200,null,80);
commit;

update exam_emp
set deptno = 70
where sal >
(select avg(sal) 
 from exam_emp 
where deptno = 50);

update exam_emp
set sal = sal * 1.1 ,deptno = 80
where hiredate > (select hiredate from exam_emp where deptno = 60);

delete from exam_emp
where empno in (select e.empno
                from exam_emp e, exam_salgrade s
                where e.sal between s.losal and s.hisal
                and s.grade = 5);
commit;