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
