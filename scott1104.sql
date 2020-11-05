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

--between a and b

--1) �޿��� 2000�̻� 3000 ������ ��� ���� ��ȸ
select * from emp where sal>=2000 and sal <=3000;
select * from emp where sal BETWEEN 2000 AND 3000;

--2) �޿��� 2000�̻� 3000 ���ϰ� �ƴ� ��� ���� ��ȸ

select * from emp where sal not BETWEEN 2000 AND 3000;

--like : ���ڿ� �˻� ���(s�� �����ϴ� ~~,h�� ������...,����뿡 t�� ������ ���)
--1) ����̸��� S �� �����ϴ� ��� ������� ��ȸ�ϱ�
select * from emp where ename like 'S%';

--2)��� �̸��� �ι�° ���ڰ� L�� ����� ��ȸ(_�� �����ϳ��� �ǹ���)
select * from emp where ename like '_L%';

--3)��� �̸��� AM�� ���ԵǾ� �ִ� ����� ��ȸ
select * from emp where ename like '%AM%';

--4)��� �̸��� AM�� ���ԵǾ� �����ʴ� ����� ��ȸ
select * from emp where ename not like '%AM%';

--is null
select * from emp where comm is null;
select * from emp where comm is not null;

--mgr(�Ŵ���id)�� null�� ������� ��ȸ
select * from emp where mgr is null;

--���տ����� : ������(union),������(intersect), ������(minus)

--deptno �� 10�� ���̺� �� deptno �� 20�� ����� ���ؼ� ���ؼ� �����ֱ�
select empno, ename, sal, deptno from emp where deptno = 10
UNION
select empno, ename, sal, deptno from emp where deptno = 10 ;

select empno, ename, sal, deptno from emp where deptno = 10
UNION all
select empno, ename, sal, deptno from emp where deptno = 10 ;

--�μ���ȣ�� 10�� �ƴ� ������� ���� ��ȸ
select empno, ename, sal,deptno from emp
MINUS
select empno, ename, sal,deptno from emp where deptno = 10;

--�μ���ȣ��10�� ������� ��ȸ
select empno, ename, sal,deptno from emp
INTERSECT
select empno, ename, sal,deptno from emp where deptno = 10;

--20,30�� �μ��� �ٹ��ϰ��ִ»����sal�� 2000 �ʰ��� ����� ���� �ΰ���
--����� select���� ����Ͽ� ,�����ȣ, �̸�, �޿�, �μ���ȣ ���

select empno, ename, sal, deptno from emp where deptno in (20,30) and sal > 2000;

select empno, ename, sal, deptno from emp where deptno in (20,30)
INTERSECT
select empno, ename, sal, deptno from emp where sal > 2000;

select empno, ename, sal, deptno from emp where sal > 2000
minus
select empno, ename, sal, deptno from emp where deptno = 10;

--����Ŭ �Լ�
--1) �����Լ� : upper, lower, initcap, length, lengthb
--ename�� upper, lower, initcap���� ��ȯ�Ͽ� ��ȸ
select ename, upper(ename),lower(ename), initcap(ename) from emp;

-- dual ���̺� �̿�(sys�� �����ϰ� �ִ� ���̺�� �ӽÿ����̳� �Լ��ǰ������
--Ȯ���ϴ� �뵵)

select length('�ѱ�'), lengthb('�ѱ�') from dual;

--��å �̸��� 6���� �̻��� ������� ���� ����
select * from emp where length(job) >= 6;

--���ڿ� �Լ� : substr
select job, substr(job,1,2), substr(job,3,2), substr(job,5) from emp;

select job, substr(job, -length(job)),substr(job, -length(job),2),substr(job,-3)
from emp;

-- ���ڿ� �Լ�: instr(Ư������ ��ġ ã��)
select instr('hello, oracle!','l') as instr_1,
       instr('hello, oracle!', 'l',5) as instr_2,
       instr('hello, oracle!', 'l',2,2) as instr_3
       from dual;
       
--���ڿ� �Լ� : replace(ã�Ƽ� �ٲٱ�)
select replace('�̰��� oracle�̴�','�̰���','This is')
from dual;

select '010-1234-5678' as replace_before,
replace('010-1234-5678','-',' ') as replace_1,
replace('010-1234-5678','-') as replace_2
from dual;

--���ڿ� �Լ� :concat(����)
--empno, ename�� �����Ͽ� ��ȸ
select concat(empno,ename), concat(empno,concat(':',ename))
from emp
where ename = 'SCOTT';

-- ||:������ �ǹ̷� ����
select empno || ename, empno || ':' ||ename
from emp
where ename = 'SCOTT';

--���ڿ� �Լ� : trim(��������),ltrim(���� ���� ����),rtrim(������ ���� ����)
select '    �̰���    ', trim('    �̰���    ')
from dual;

--���ڿ� �Լ� :reverse
select reverse('Oracle') from dual;

--2.�����Լ� :round(�ݿø�),trunc(����),ceil(�Էµ� ���ڿ� ����� ū����)
--           floor(�Էµ� ���ڿ� ����� ���� ����),mod(������)

select round(1234.5678) as round,
       round(1234.5678,0) as round_1,
       round(1234.5678,1) as round_2,
       round(1234.5678,-1) as round_minus,
       round(1234.5678,-2) as round_minus2
from dual;

select trunc(1234.5678) as trunc,
       trunc(1234.5678,0) as trunc_1,
       trunc(1234.5678,1) as trunc_2,
       trunc(1234.5678,-1) as trunc_minus,
       trunc(1234.5678,-2) as trunc_minus2
from dual;

select ceil(3.14),floor(3.14),ceil(-3.14),floor(-3.14)
from dual;

select mod(15,6),mod(10,2),mod(11,2) from dual;

--3.��¥�Լ� : SYSDATE,CURRENT_DATE,CURRENT_TIMESTAMP
SELECT SYSDATE,CURRENT_DATE,CURRENT_TIMESTAMP from dual;
--��¥�����ʹ� ������ ������: ��¥������ +1,-1,��¥������ - ��¥������
--��¥������ + ��¥�����ʹ� �ȵ�

select sysdate as now, sysdate-1 as yesterday,sysdate+1 as tomorrow
from dual;

--��¥�Լ�: add_months
select sysdate,add_months(sysdate,3) from dual;

--�Ի�10�ֳ��� �Ǵ� ����� ��ȸ
select empno,ename,hiredate, add_months(hiredate,120) from emp;

--�м� 38�� �̸��� ��� ��ȸ
select * from emp
where sysdate < add_months(hiredate,456);

--��¥�Լ� : months_between(�� ��¥ ������ ����)
select * from emp where months_between(sysdate,hiredate)< 456;

select empno, ename, hiredate, sysdate,months_between(hiredate,sysdate) as months1,
months_between(sysdate,hiredate) as months2, trunc(months_between(sysdate,hiredate))
from emp;

--��¥�Լ�: next_day, last_day
select sysdate, next_day(sysdate,'������'),last_day(sysdate)
from dual;

--4. ����ȯ �Լ� : to_char(��¥,���ڵ����͸� ���ڷ� ��ȯ),
--                to_number(���ڵ����͸� ���ڷ� ��ȯ),
--                to_date(���ڵ����͸� ��¥�� ��ȯ)

select to_char(sysdate,'YYYY/MM/DD') as ���糯¥ from dual;
select to_char(sysdate,'MM') as ���糯¥ from dual;
select to_char(sysdate,'DD') as ���糯¥ from dual;
select to_char(sysdate,'mon') as ���糯¥ from dual;
select to_char(sysdate,'day') as ���糯¥ from dual;
select to_char(sysdate,'HH:MI:SS') as ���糯¥ from dual;
select to_char(sysdate,'HH12:MI:SS') as ���糯¥ from dual;
select to_char(sysdate,'AM HH24:MI:SS') as ���糯¥ from dual;
select to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') as ���糯¥�ð� from dual;


select 1300-'1500','1300'+1500 from dual; 
select 1300-to_number('1500'),to_number('1300')+1500 from dual; 
select to_number('1,300','999,999,999') - to_number('1,500','999,999,999') from dual; 
select sal, to_char(sal,'$999,999') as sal_$,
 to_char(sal,'L999,999') as sal_L,
 to_char(sal,'$999,999.00') as sal_1,
 to_char(sal,'000,999,999.00') as sal_2,
 to_char(sal,'000999999.99') as sal_3,
 to_char(sal,'999,999,00') as sal_4
 from emp;

select to_date('2020-11-05','yyyy/mm/dd') as todate1,
       to_date('20201105','yyyy-mm-dd') as todate2 from dual;
       
-- 1981�� 6��1�� ���Ŀ� �Ի��� ������� ��ȸ
select * 
from emp 
where hiredate > to_date('19810601','yyyy-mm-dd');

select to_date('2019-12-20')-to_date('2019-10-20') from dual;

--��ó���Լ� :nvl,nvl2
select empno, ename,sal, comm, sal+comm from emp;


select empno, ename,sal, comm, sal+comm,nvl(comm,0),sal+nvl(comm,0)
from emp;

select empno, ename,sal, comm, sal+comm,nvl2(comm,'o','x'),
sal+nvl2(comm,sal*12+comm,sal*12) as ammsal
from emp;

--decode�Լ��� case��
--job��  manager, salesman, analyst ��쿡 ������ �ٸ� ������ �����ϰ� �ʹٸ�?
select empno, ename,job,sal,decode(job,'MANAGER',sal*1.1,
                                        'SALESMAN',sal*1.05,
                                        'ANLYST',sal,
                                         sal*1.03) 
as upsal from emp;

select empno, ename,job,sal,case job
                            when 'MANAGER' then sal*1.1
                            when'SALESMAN' then sal*1.05
                            when'ANLYST' then sal
                            else sal*1.03 end
as upsal from emp;

select empno, ename,job,sal,case
                            when comm is null then '�ش���׾���'
                            when comm=0 then '�������'
                            when comm>0 then '���� : '|| comm
                            end as comm_text from emp;
