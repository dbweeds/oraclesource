--sum : �հ�
select sum(sal), sum(distinct sal),sum(all sal) from emp;

--count : ����
select count(*) from emp;

--�μ���ȣ�� 30���� ���� �� ���ϱ�
select count(*) from emp where deptno =30;

select count(sal), count(distinct sal),count(all sal) from emp;

--max(�ִ밪),min(�ּҰ�)
select max(sal), min(sal) from emp;

--�μ���ȣ�� 20�� ����� �Ի����� �����ֱ� �Ի��� ���ϱ�
select  max(hiredate) from emp where deptno = 20;

--average : ���
select avg(sal) from emp;
select avg(sal) from emp where deptno = 30;
select avg(distinct sal) from emp;

--�μ��� ������ ����� �˰�ʹٸ�?
select avg(sal) from emp where deptno = 10;
select avg(sal) from emp where deptno = 20;
select avg(sal) from emp where deptno = 30;

--group by : ������� ���ϴ� ���� ���� ���
select deptno,avg(sal) from emp group by deptno;

--�μ���ȣ�� �߰����� ��� ���ϱ�
select deptno,avg(comm) from emp group by deptno;

--�μ���ȣ, ��å�� �޿� ��� ���ϱ�
select deptno, avg(sal),job from emp group by deptno,job order by deptno,job;

--group by���� ���� �ȵǴ� ���� select�� �����ϸ� �ȵ�
select ename,deptno,avg(sal)
from emp
GROUP BY deptno;