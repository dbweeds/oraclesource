-- ȸ������, �Խñ� ���,�Ա�....

--������ dept ���̺��� �����ؼ� dept_temp���̺� ����
create table DEPT_TEMP as select * from dept;

--���� ���̺� ��ȸ
select * from dept_temp;

--������ �߰��ϱ�(��� 1)
insert into dept_temp(deptno, dname,loc) values(50,'DATABASE','SEOUL');

--������ �߰��ϱ�(��� 2)
insert into dept_temp values(60,'NETWORK','BUSAN');

-- �����߻�
--insert into dept_temp(deptno, dname,loc) values(50,'DATABASE');
--insert into dept_temp(deptno, dname,loc) values(500,'DATABASE','SEOUL');

--null�����ϱ�
--��������� null ����
insert into dept_temp(deptno, dname,loc) values(70,'DATABASE',null);
insert into dept_temp(deptno, dname,loc) values(80,'MOBILE','');

--���������� null ����
insert into dept_temp(deptno,loc) values(90,'INCHEON');

--emp���̺��� �����Ͽ� emp_temp ���̺� ����
create table EMP_TEMP as select * from emp;

--���̺� ����
drop table emp_temp;

--emp���̺��� �����Ͽ� emp_temp ���̺� �����ϵ� ������ �����ϱ�
create table EMP_TEMP as select * from emp where 1<>1;
select * from emp_temp;

desc emp_temp;
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'ȫ�浿','PRESIDENT',null,'2020/11/09',4000,null,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(8888,'������','MANAGER',null,'2020/10/08',3000,null,10);

--dml(������ ���۾�)-> select,update,delete,insert->Ŀ��(�����ݿ�), rollback(�ٽ� �ǵ�����)
--Ʈ����� : Ŀ�԰� �ѹ�

--�����ݿ�
COMMIT;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(7777,'����ȭ','MANAGER',null,to_date('07/01/2010','dd/mm/yyyy'),4000,null,20);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(6666,'�̼���','MANAGER',null,sysdate,4000,null,20);

--emp���̺��� salfrade���̺��� �����Ͽ� �޿� ����� 1����� �������
--emp_temp ���̺� �߰��ϱ�
--���������� �ۼ�(�����Ͱ� �߰��Ǵ� ���̺��� �� ������ ���������� �� ������ ��ġ)
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
select empno,ename,job,mgr,hiredate,sal,comm,deptno 
from emp e ,salgrade s where e.sal between s.losal and s.hisal and s.grade = 1;

select * from emp_temp;













