--hr 계정이 가지고있는 모든 테이블 보기
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

--문자열 함수 실습
--1.first_name이 Curtis 인사람의 fitst_name, last_name, email,phone_number,
-- job_id를 조회한다, 단 job_id의 결과는 소문자로 출력되도록 한다,
select first_name,last_name,email,phone_number, lower(job_id) from employees 
where first_name = 'Curtis';


--2.부서번호가 70,80,90인 사람들의 employee_id , first_name, hier_date, job_id를 
--조회한다. 단, job_id 가 it_prog인 사원의 경우 프로그래머로 변경하여 출력한다

select employee_id , first_name, hire_date, replace (job_id,'IT_PROG','프로그래머') 
from employees
where department_id in(60,70,80,90);

--job_id가 ad_pres, pu_clerk인 사원들의  employee_id , first_name,last_name,
--department_id, job_id 를 조회하시오, 단, 사원명은 first_name,last_name 을 연결하여 출력
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

--다중행함수
--회사내의 최대 연봉및 최소 연봉차이를 조회
select max(salary)-min(salary) from employees;
--매니저로 근무하는 사원들의 인원수 조회
select count(distinct manager_id) as 매니저 from employees;

--부서별 직원의 수를 구하고 부서번호의 오름차순으로 출력
select department_id,count(*) 
from employees 
group by department_id 
order by department_id;
--부서별 급여의 평균 연봉을 출력하고,평균연봉은 정수만 나오도록 한다.
--부서변호별 오름차순으로 정렬
select department_id,round(avg(salary),0)
from employees 
group by department_id 
order by department_id;
--동일한 직업을 가진 사원수를 조회
select job_id,count(employee_id) 
from employees 
group by job_id;


                        