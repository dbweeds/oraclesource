--scott ������ �������ִ� ��� ���̺� ����
select * from tab;

--emp ���̺��� ����(�̸� -�ʵ�, ���� - Ÿ������(ũ��))
--number ���� (0,0)�޼��ڴ� �Ҽ�����,varchar2 - stringŸ�� 
desc emp;

--emp ���̺��� ��� ���� ��ȸ
select * FROM emp;

--emp ���̺��� Ư�� �ʵ常 ��ȸ
select ename, job, sal from emp;

--�ߺ� ���ڵ� ������ �� ��ȸ : distinct
select distinct deptno from emp;
select deptno from emp;

--alais (��Ī) : as (�������� �ٲ����ʰ� �����ٶ��� �ٲ�)
select empno as �����ȣ from emp;

select ename,sal, sal*12+comm as ����,comm from emp;

select ename as ����̸�,job as "�� å" from emp;

--order by : �����Ͽ� ��ȸ
--�ϳ��� ���� ������ �־� ��������(asc) ��ȸ
select ename,sal from emp order by sal;

--�ϳ��� ���� ������ �־� ��������(desc) ��ȸ
select ename,sal from emp order by sal desc;

--��ü �����͸� ��ȸ(�����ȣ ��������)
select * from emp order by empno;

--�μ���ȣ�� ���������̰�, �μ���ȣ�� �����ϴٸ� �޿��� ��������
select * from emp order by deptno asc, sal desc;

select empno as employee_no, ename as employee_name, job, mgr as manager,
       hiredate, sal as salary,comm as commission,deptno as department_no 
       from emp order by deptno desc,ename asc;
       
--where : ��ȸ�� �Ҷ� ���� �ֱ�
--�μ���ȣ�� 30���� ��� ��ȸ
select * FROM emp where deptno = 30;

--�����ȣ�� 7782�� ��� ��ȸ
select * FROM emp where empno = 7782;

--�μ���ȣ�� 30�̰�, �����å�� SALESMAN ���� ��ȸ
select * FROM emp where deptno = 30 and job ='SALESMAN';

--�����ȣ�� 7499, �μ���ȣ�� 30�� ���� ����
select * FROM emp where empno = 7499 and deptno = 30;

--�μ���ȣ�� 30�̰ų� �����å�� CLERK������ȸ
select * FROM emp where deptno = 30 or job ='CLERK';

--�μ���ȣ�� 20�̰ų� �����å�� SALESMAN������ȸ
select * FROM emp where deptno = 20 or job ='SALESMAN';

--�����ڸ� �̿��� ��ȸ

--��� ������ :sal*12 �� �ݾ��� 36000 �ε����� ��ȸ
select * from emp where sal*12 =36000;

--���迬���� : >,<,>=,<=
select * from emp where sal > 3000;
select * from emp where sal >= 3000;

select *from emp where ename >= 'F';

--�������� : and,or
--�޿��� 2500�̻��̰�,������ analyst�� ������� ��ȸ

select * from emp where sal >= 2500 and job = 'ANALYST';

select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';

--������� : ���� �׸��� ������ �˻�

select * from emp where sal != 3000;
select * from emp where sal <> 3000;
select * from emp where sal ^= 3000;

--in ������
select * from emp where job in ('MANAGER' ,'SALESMAN','CLERK');
select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';

select * from emp where job != 'MANAGER' and job != 'SALESMAN' and job != 'CLERK';
select * from emp where job not in('MANAGER' ,'SALESMAN','CLERK');

select * from emp where deptno in(10,20);


 

