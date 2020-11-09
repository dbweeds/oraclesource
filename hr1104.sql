--hr ������ �������ִ� ��� ���̺� ����
select * from tab;

desc employees;

select * from employees;

select first_name, last_name, job_id from employees;

select distinct job_id from employees;

select last_name, department_id from employees where employee_id = 176;

select last_name, salary from employees where salary >= 12000;

select last_name, salary from employees where salary >= 12000 or salary <= 5000 ;

select last_name, department_id from employees 
where department_id in(20,50) order by last_name, department_id;

select last_name,salary,commission_pct FROM employees 
where commission_pct > 0 order by salary desc, commission_pct desc;

select * FROM employees where salary in(2500,3500,7500) or job_id in('SA_REP','ST_CLERK');

select LAST_NAME,HIRE_DATE,EMPLOYEE_ID FROM employees
where HIRE_DATE >= '08/02/20' and HIRE_DATE <= '08/05/01' order by HIRE_DATE desc;

select LAST_NAME,HIRE_DATE FROM employees 
where HIRE_DATE >= '04/01/01' and HIRE_DATE < '05/01/01' order by HIRE_DATE;


select LAST_NAME,HIRE_DATE FROM employees where HIRE_DATE >= '04/01/01' and HIRE_DATE < '05/01/01' order by HIRE_DATE;

select last_name, salary from employees 
where department_id in (20, 50) and salary between 5000 and  12000 
order by salary;

select LAST_NAME,HIRE_DATE FROM employees 
where HIRE_DATE between '2004/01/01' and '2004/12/31' order by HIRE_DATE;

select last_name, salary from employees 
where salary not between 5000 and  12000;

select LAST_NAME,HIRE_DATE FROM employees 
where HIRE_DATE like '04%' order by HIRE_DATE;

select LAST_NAME,employee_id FROM employees 
where LAST_NAME like '%u%';

select LAST_NAME FROM employees 
where LAST_NAME like '___a%';

select LAST_NAME FROM employees 
where LAST_NAME like '%a%' or LAST_NAME like '%e%' order by LAST_NAME;

select LAST_NAME FROM employees 
where LAST_NAME like '%a%e%' or LAST_NAME like '%e%a%' order by LAST_NAME;

select LAST_NAME FROM employees 
where LAST_NAME like '%a%e%' order by LAST_NAME;

select LAST_NAME FROM employees 
where LAST_NAME like '%a%' and LAST_NAME like '%e%' order by LAST_NAME;

select LAST_NAME ,job_id FROM employees where manager_id is null;

select distinct department_id    from employees 
where job_id not in ('ST_CLERK') and department_id is not null ;

select employee_id, first_name, job_id,salary*commission_pct as commission from employees
WHERE commission_pct is not null;

--���ڿ� �Լ� �ǽ�
--1.first_name�� Curtis �λ���� fitst_name, last_name, email,phone_number,
-- job_id�� ��ȸ�Ѵ�, �� job_id�� ����� �ҹ��ڷ� ��µǵ��� �Ѵ�,
select first_name,last_name,email,phone_number, lower(job_id) from employees 
where first_name = 'Curtis';


--2.�μ���ȣ�� 70,80,90�� ������� employee_id , first_name, hier_date, job_id�� 
--��ȸ�Ѵ�. ��, job_id �� it_prog�� ����� ��� ���α׷��ӷ� �����Ͽ� ����Ѵ�

select employee_id , first_name, hire_date, replace (job_id,'IT_PROG','���α׷���') 
from employees
where department_id in(60,70,80,90);

--job_id�� ad_pres, pu_clerk�� �������  employee_id , first_name,last_name,
--department_id, job_id �� ��ȸ�Ͻÿ�, ��, ������� first_name,last_name �� �����Ͽ� ���
select employee_id , first_name ||' '|| last_name,department_id, job_id
from employees
where job_id in('AD_PRES','PU_CLERK');

select employee_id , concat(first_name,concat(' ',last_name)),department_id, job_id
from employees
where job_id in('AD_PRES','PU_CLERK');

select last_name,salary,case
                        when salary<2000 then 0.0
                        when salary<4000 then 0.09
                        when salary<6000 then 0.2
                        when salary<8000 then 0.3
                        when salary<10000 then 0.4
                        when salary<12000 then 0.42
                        when salary<14000 then 0.44
                        else 0.45 end as TAX_RATE from employees
                        where department_id = 80;
                        
select last_name,salary,decode(trunc(salary/2000,0),
                        0,0.00,
                        1,0.09,
                        2,0.20,
                        3,0.30,
                        4,0.40,
                        5,0.42,
                        6,0.44,
                        0.45) as tax_rate
from employees where department_id = 80;            

--�������Լ�
--ȸ�系�� �ִ� ������ �ּ� �������̸� ��ȸ
select max(salary)-min(salary) from employees;
--�Ŵ����� �ٹ��ϴ� ������� �ο��� ��ȸ
select count(distinct manager_id) as �Ŵ��� from employees;

--�μ��� ������ ���� ���ϰ� �μ���ȣ�� ������������ ���
select department_id,count(*) 
from employees 
group by department_id 
order by department_id;
--�μ��� �޿��� ��� ������ ����ϰ�,��տ����� ������ �������� �Ѵ�.
--�μ���ȣ�� ������������ ����
select department_id,round(avg(salary),0)
from employees 
group by department_id 
order by department_id;
--������ ������ ���� ������� ��ȸ
select job_id,count(employee_id) 
from employees 
group by job_id;

--join �ǽ�
select * from locations;
--�ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��ڸ� ã��hire_date, last_name,manager_id �� ����Ͻÿ�
--(employees selef join) 37��
select e1.hire_date, e1.last_name,e1.manager_id, e2.employee_id,e2.hire_date
from employees e1 inner join employees e2
on e1.manager_id = e2.employee_id 
and e1.hire_date<e2.hire_date;
--���� �̸��� t�� �����ϴ� ������ ��� ������� ���,last_name,�μ���ȣ ��ȸ
--employees�� department_id �� departments�� department_id ������
--departments�� location_id�� locations�� location_id���� 2��
select e.employee_id ,e.last_name,e.department_id
from employees e inner join departments d 
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id and l.city like'T%';

select * from departments;
--��ġ id�� 1700�� ������ ������� employee_id,last_name,department_id,salary ��ȸ
--employees �� departments����  18��
select e.employee_id ,e.last_name,e.department_id, e.salary ,d.location_id
from employees e inner join departments d
on e.department_id = d.department_id and
d.location_id = 1700;

--department_name, location_id, �� �μ��� �����, �� �μ��� ��� ���� ��ȸ
--employees, department ���� 11��
select department_name, location_id ,count(*),floor(avg(salary))
from employees e inner join departments d
on e.department_id = d.department_id
group by department_name, location_id;

select * from employees;
select * from departments;
--executive �μ��� �ٹ��ϴ� ��������� department_id, last_name, job_id ��ȸ
--employees, department ���� 
select e.department_id, e.last_name, e.job_id
FROM employees e inner join departments d
on e.department_id = d.department_id
and d.department_name = 'Executive';

select * from employees;
select * from job_history;
--������ ������ ������ ������ �ִ� ������� ��� �� job_id ��ȸ
--employees,job_history ����
select e.employee_id, e.job_id
from employees e inner join job_history j
on e.employee_id = j.employee_id
and e.job_id = j.job_id;

--�� ����� �Ҽ� �μ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� 
--����� �����ϴ� ��� ������� last_name�� ��ȸ
select distinct e1.first_name || ' ' || e1.last_name
from employees e1 , employees e2
where e1.department_id = e2.department_id
and e1.hire_date < e2.hire_date
and e1.salary < e2.salary;

--�������� �ǽ�
select * from employees;
--ȸ����ü��տ������� ������ �޴� ������� last_name, salary ��ȸ
select last_name, salary
from employees
where salary > (select avg(salary) from employees);
--last_name �� u�� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� employee_id, last_name
select employee_id ,last_name
from employees
where department_id in (select distinct department_id from employees where last_name like '%u%' );
--not exists �����ڸ� ����Ͽ� �Ŵ����� �ƴ� ��� �̸��� ��ȸ
select first_name||' '|| last_name
from employees e1
where not exists(select distinct manager_id
                 from employees e2
                 where e1.employee_id = e2.manager_id );
                 
 select first_name||' '|| last_name
from employees e1
where e1.employee_id not in (select distinct manager_id
                 from employees e2
                 where e1.employee_id = e2.manager_id );   

