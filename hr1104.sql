--hr 계정이 가지고있는 모든 테이블 보기
select * from tab;

desc employees;

select * from employees;

select first_name, last_name, job_id from employees;

select distinct job_id from employees;

select last_name, department_id from employees where employee_id = 176;

select last_name, salary from employees where salary >= 12000;

select last_name, salary from employees where salary >= 12000 or salary <= 5000 ;

select last_name, department_id from employees where department_id in(20,50) order by last_name  ;

select last_name,salary,commission_pct FROM employees where commission_pct > 0 order by salary asc, commission_pct asc;

select * FROM employees where salary in(2500,3500,7500) or job_id in('SA_REP','ST_CLERK');

select LAST_NAME,HIRE_DATE,EMPLOYEE_ID FROM employees where HIRE_DATE >= '08/02/20' and HIRE_DATE <= '08/05/01' order by HIRE_DATE desc;

select LAST_NAME,HIRE_DATE FROM employees where HIRE_DATE >= '04/01/01' and HIRE_DATE < '05/01/01' order by HIRE_DATE;


select LAST_NAME,HIRE_DATE FROM employees where HIRE_DATE >= '04/01/01' and HIRE_DATE < '05/01/01' order by HIRE_DATE;

