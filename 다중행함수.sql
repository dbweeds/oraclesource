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
/*select ename,deptno,avg(sal)
from emp
GROUP BY deptno;
*/

--having : group by ���� ������ �ٶ� ���
--�� �μ��� ��å�� ��� �޿��� ���ϵ� ����� �޿��� 2000 �̻��� �׷츸
--���
--where���� �׷��Լ��� ���ü�����
select deptno,job,avg(sal) from emp 
group by deptno,job 
having avg(sal)>2000
order by deptno,job;

--emp���̺��� �μ��� ��å�� ��� �޿��� 500�̻��� ������Ǥ�
--�μ���ȣ,��å,�μ��� ������ ��� �޿� ���
select deptno,job,avg(sal)
from emp
group by deptno,job having avg(sal) >=500;

--������� from >select >where >group
select deptno,job,avg(sal)
from emp
where sal<=3000
group by deptno,job having avg(sal) >=500
order by deptno,job;

--����
--���ü��ִ� ��� ���� ��ȸ
select * from emp,dept order by empno;
select count(*) from emp,dept order by empno;


select *from dept;--4��
select * from emp;--14��

--1) ��������(�����)
select * 
from emp,dept
where emp.deptno = dept.deptno
order by empno;

select * 
from emp E, dept D
where E.deptno = D.deptno
order by empno;

select * 
from emp inner join dept 
on emp.deptno = dept.deptno--���α���
order by empno;

select * 
from emp e inner join dept d 
on e.deptno = d.deptno--���α���
order by empno;

--�� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ���
-- ��� ���̺� �ִ� �ʵ带 ������ �ð����� ��Ȯ�� ���
select empno,ename,job,d.deptno,dname 
from emp E, dept D
where E.deptno = D.deptno
order by empno;

--emp���̺�� dept ���̺��� �����Ͽ� enpno, ename, sal, deptno,
--dname, loc �� ��ȸ�Ѵ�. ��, �޿��� 3000 �̻��� ����� ���
select e.empno, e.ename, e.sal, d.deptno,d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and sal>=3000;

--emp ü�̺��� ��Ī�� e�� ,dept ���̺� ��Ī�� d�� �Ͽ�
--�޿��� 2500 �����̰�, �����ȣ�� 9999 ������ ����� ������ ���
select *
from emp e, dept d
where e.deptno = d.deptno and e.sal<=2500 and e.empno <=9999;

--emp ü�̺��� ��Ī�� e�� ,salfrade ���̺� ��Ī�� s�� �Ͽ�
--�� ����� ������ ���Ҿ� ����� ��� ������ ���
select *
from salgrade;

select e.*, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal > s.losal and e.sal < hisal;

--2)��������(��ü����) : �������̺��� �ڱ� �ڽ� ���̺��϶�
select * from emp;

select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1,emp e2
where e1.mgr = e2.empno;

--outer join(�ܺ�����) : ������ �������� �ʴ� ������ ����

--1)left outer join
select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1 left outer join emp e2
on e1.mgr = e2.empno;

select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1,emp e2
where e1.mgr = e2.empno(+);

--2)right outer join
select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1 right outer join emp e2
on e1.mgr = e2.empno;

select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1,emp e2
where e1.mgr(+) = e2.empno;

--3)full outer join
select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1 FULL outer join emp e2
on e1.mgr = e2.empno;

select *from dept;

SELECT e.deptno, d.dname,e.empno, e.empno, e.sal
FROM emp e inner join dept d
on e.deptno = d.deptno
order by e.deptno;

SELECT E.deptno, d.dname,floor(avg(sal)),max(sal),min(sal),count(*)
FROM emp e inner join dept d
on e.deptno = d.deptno
group by d.deptno ,d.dname
order by e.deptno;

SELECT d.deptno, d.dname,e.empno,e.ename,e.job, e.sal
FROM emp e right outer join dept d
on e.deptno = d.deptno
order by e.deptno;

SELECT e1.deptno,d.dname,e1.empno,e1.ename,e1.mgr,e1.sal,
       d.deptno,s.losal,s.hisal,s.grade,e1.mgr,e1.ename
FROM dept d,emp e1 ,salgrade s,emp e2
where e1.deptno(+) = d.deptno 
and e1.sal >= s.losal(+) and e1.sal <= s.hisal(+)
and e1.mgr = e2.empno(+)
order by d.deptno, e1.deptno;

SELECT d1.deptno,d1.dname,e1.empno,e1.ename,e1.mgr,
       e1.sal,d1.deptno,losal,hisal,grade,e1.mgr,e1.ename
from emp e1
right outer join dept d1 on e1.deptno = d1.deptno
left OUTER join salgrade s on e1.sal between s.losal and s.hisal
left outer join emp e2 on e1.mgr = e2.empno
order by d1.deptno,e1.empno;

select *
from dept;