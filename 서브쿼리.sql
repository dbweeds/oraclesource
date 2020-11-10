-- ������ �޿����� ���� �޿��� �޴� ����� ����ϱ�

--������ �޿� �˾Ƴ���
select sal from emp where ename='JONES';

--���� �޿� �������ϱ�
select * from emp where sal>2975;

--�������� : ������ �ȿ� �ٸ� �������� �����ϰ� �ִ� ����
--���� �� �������� : >,<,=,>=,<=, �������� : <>,^=,!=
select * from emp where sal > (select sal from emp where ename='JONES');

--����̸��� ALLEN �� ����� �߰����纸�� ���� �޴� ����� ���
select * from emp where comm > (select comm from emp where ename='ALLEN');

--����̸��� WARD �� ����� �Ի��Ϻ��� ���� �Ի��� ����� ���
select * from emp where hiredate < (select hiredate from emp where ename='WARD');

--20�� �μ��� ���� ����� ��ü ����� ���ձ޿����� ���� �޿��� �޴� ������
select * from emp where deptno = 20 and sal > (select avg(sal) from emp);

select * from dept;
--20�� �μ��� ���� ����� ��ü ����� ���ձ޿����� ���� �޿��� �޴� ������
--�μ���, ������ġ
select e.* , d.dname , d.loc
from emp e inner join dept d
on e.deptno = d.deptno and
d.deptno = 20 and sal > (select avg(sal) from emp);

--������ ��������

--�������� ����� 2���̻� ������ ����� ������ ���������� ������ ���Ұ�
--���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
--select * from emp where sal >= (select max(sal) from emp group by deptno);
select max(sal) from emp group by deptno;
--in
select * from emp where sal in (select max(sal) from emp group by deptno);

--any(some)

-- = any : in �� �������� ���� ����, ��, in�� �� ���� ���
select * from emp where sal = any (select max(sal) from emp group by deptno);

select * from emp where sal = some (select max(sal) from emp group by deptno);

--30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���
select * from emp where sal < any (select max(sal) from emp where deptno = 30);


select distinct sal from emp where deptno = 30;
select * from emp where sal < any (select sal from emp where deptno = 30);

--30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���
select * from emp where sal > any (select sal from emp where deptno = 30);


--all : ���� ������ ����� ��� �����ϴ� ���� ������ �����Ҷ�
--�μ���ȣ��30���� ������� �ּ� �޿����� �� ���� �޿��� �޴� ��� ���
select * from emp where sal < all (select sal from emp where deptno = 30);

--exists : in �� ����� ����, �� in���� ������ ���
--�������� ����� �����ϸ� �������� ����� ���

select * from emp where exists (select dname from dept where deptno = 20);
select * from emp where not exists (select dname from dept where deptno = 20);


select empno,deptno
from emp
where exists (select deptno 
              from dept 
              where deptno in (20,30) and emp.deptno = dept.deptno);
              
select empno,deptno
from emp
where exists (select 1
              from dept 
              where deptno in (20,30) and emp.deptno = dept.deptno);
              
select empno,deptno
from emp
where not exists (select 1
              from dept 
              where deptno in (20,30) and emp.deptno = dept.deptno);

select job,empno,ename,sal,e.deptno,dname
from emp e ,dept d
where e.deptno = d.deptno and
job = (select job
       from emp
       where ename = 'ALLEN' );

SELECT * FROM emp;
SELECT * FROM salgrade;
SELECT * FROM dept;

select empno,ename,dname,hiredate,loc,sal,grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno 
and e.sal BETWEEN s.losal and s.hisal
and sal > all (select avg(sal) from emp)
order by sal DESC,empno;


--���� �� �������� : ���������� selext���� ���� �÷��� ������ ������ ���
select * from emp where (deptno, sal) in (select deptno,max(sal) from emp group by deptno);

--from ���� ����ϴ� ���� ����(�ζ��� ��)
select e.empno, e.ename,d.deptno, d.dname, d.loc
from(select * from emp where deptno = 10) e,(select * from dept) d
where e.deptno = d.deptno;

--select ���� ����ϴ� �������� - ��Į�� ��������


select e.empno, e.ename,d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
and e.job not in(select distinct job
               from emp
               where deptno = 30)
and e.deptno = 10;

select empno,ename, sal, (select grade from salgrade where e.sal between losal and hisal) as grade
from emp
where sal> (select max(sal) from emp where job='SALESMAN');

select empno,ename, sal
from emp
where sal > all(select max(sal) from emp where job='SALESMAN');
