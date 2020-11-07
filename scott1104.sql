--scott 계정이 가지고있는 모든 테이블 보기
select * from tab;

--emp 테이블의 구조(이름 -필드, 유형 - 타입유형(크기))
--number 정수 (0,0)뒷숫자는 소수점수,varchar2 - string타입 
desc emp;

--emp 테이블의 모든 내용 조회
select * FROM emp;

--emp 테이블의 특정 필드만 조회
select ename, job, sal from emp;

--중복 레코드 제거한 후 조회 : distinct
select distinct deptno from emp;
select deptno from emp;

--alais (별칭) : as (원본문을 바꾸지않고 보여줄때만 바뀜)
select empno as 사원번호 from emp;

select ename,sal, sal*12+comm as 연봉,comm from emp;

select ename as 사원이름,job as "직 책" from emp;

--order by : 정렬하여 조회
--하나의 열로 기준을 주어 오름차순(asc) 조회
select ename,sal from emp order by sal;

--하나의 열로 기준을 주어 내림차순(desc) 조회
select ename,sal from emp order by sal desc;

--전체 데이터를 조회(사원번호 오름차순)
select * from emp order by empno;

--부서번호의 오름차순이고, 부서번호가 동일하다면 급여의 내림차순
select * from emp order by deptno asc, sal desc;

select empno as employee_no, ename as employee_name, job, mgr as manager,
       hiredate, sal as salary,comm as commission,deptno as department_no 
       from emp order by deptno desc,ename asc;
       
--where : 조회를 할때 기준 주기
--부서번호가 30번인 사원 조회
select * FROM emp where deptno = 30;

--사원번호가 7782인 사원 조회
select * FROM emp where empno = 7782;

--부서번호가 30이고, 사원직책이 SALESMAN 정보 조회
select * FROM emp where deptno = 30 and job ='SALESMAN';

--사원번호가 7499, 부서번호가 30인 정보 조죄
select * FROM emp where empno = 7499 and deptno = 30;

--부서번호가 30이거나 사원직책이 CLERK정보조회
select * FROM emp where deptno = 30 or job ='CLERK';

--부서번호가 20이거나 사원직책이 SALESMAN정보조회
select * FROM emp where deptno = 20 or job ='SALESMAN';

--연산자를 이용한 조회

--산술 연산자 :sal*12 한 금액이 36000 인데이터 조회
select * from emp where sal*12 =36000;

--관계연산자 : >,<,>=,<=
select * from emp where sal > 3000;
select * from emp where sal >= 3000;

select *from emp where ename >= 'F';

--논리연산자 : and,or
--급여가 2500이상이고,직업이 analyst인 사원정보 조회

select * from emp where sal >= 2500 and job = 'ANALYST';

select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';

--등가연산자 : 양쪽 항목이 같은지 검사

select * from emp where sal != 3000;
select * from emp where sal <> 3000;
select * from emp where sal ^= 3000;

--in 연산자
select * from emp where job in ('MANAGER' ,'SALESMAN','CLERK');
select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK';

select * from emp where job != 'MANAGER' and job != 'SALESMAN' and job != 'CLERK';
select * from emp where job not in('MANAGER' ,'SALESMAN','CLERK');

select * from emp where deptno in(10,20);


 

