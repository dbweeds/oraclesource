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

--between a and b

--1) 급여가 2000이상 3000 이하인 사원 정보 조회
select * from emp where sal>=2000 and sal <=3000;
select * from emp where sal BETWEEN 2000 AND 3000;

--2) 급여가 2000이상 3000 이하가 아닌 사원 정보 조회

select * from emp where sal not BETWEEN 2000 AND 3000;

--like : 문자열 검색 사용(s로 시작하는 ~~,h로 끝나는...,가운대에 t가 있으면 등등)
--1) 사원이름이 S 로 시작하는 모든 사원정보 조회하기
select * from emp where ename like 'S%';

--2)사원 이름의 두번째 글자가 L인 사원만 조회(_가 글자하나를 의미함)
select * from emp where ename like '_L%';

--3)사원 이름의 AM이 포함되어 있는 사원만 조회
select * from emp where ename like '%AM%';

--4)사원 이름의 AM이 포함되어 있지않는 사원만 조회
select * from emp where ename not like '%AM%';

--is null
select * from emp where comm is null;
select * from emp where comm is not null;

--mgr(매니저id)이 null인 사원정보 조회
select * from emp where mgr is null;

--집합연산자 : 합집합(union),교집합(intersect), 차집합(minus)

--deptno 가 10인 테이블 과 deptno 가 20인 결과를 구해서 합해서 보여주기
select empno, ename, sal, deptno from emp where deptno = 10
UNION
select empno, ename, sal, deptno from emp where deptno = 10 ;

select empno, ename, sal, deptno from emp where deptno = 10
UNION all
select empno, ename, sal, deptno from emp where deptno = 10 ;

--부서번호가 10이 아닌 사원들의 정보 조회
select empno, ename, sal,deptno from emp
MINUS
select empno, ename, sal,deptno from emp where deptno = 10;

--부서번호가10인 사원정보 조회
select empno, ename, sal,deptno from emp
INTERSECT
select empno, ename, sal,deptno from emp where deptno = 10;

--20,30번 부서에 근무하고있는사원중sal이 2000 초과인 사원을 다음 두가지
--방식의 select문을 사용하여 ,사원번호, 이름, 급여, 부서번호 출력

select empno, ename, sal, deptno from emp where deptno in (20,30) and sal > 2000;

select empno, ename, sal, deptno from emp where deptno in (20,30)
INTERSECT
select empno, ename, sal, deptno from emp where sal > 2000;

select empno, ename, sal, deptno from emp where sal > 2000
minus
select empno, ename, sal, deptno from emp where deptno = 10;

--오라클 함수
--1) 문자함수 : upper, lower, initcap, length, lengthb
--ename을 upper, lower, initcap으로 변환하여 조회
select ename, upper(ename),lower(ename), initcap(ename) from emp;

-- dual 테이블 이용(sys가 소유하고 있는 테이블로 임시연산이나 함수의결과값을
--확인하는 용도)

select length('한글'), lengthb('한글') from dual;

--직책 이름이 6글자 이상인 사원들의 정보 추출
select * from emp where length(job) >= 6;

--문자열 함수 : substr
select job, substr(job,1,2), substr(job,3,2), substr(job,5) from emp;

select job, substr(job, -length(job)),substr(job, -length(job),2),substr(job,-3)
from emp;

-- 문자열 함수: instr(특정문자 위치 찾기)
select instr('hello, oracle!','l') as instr_1,
       instr('hello, oracle!', 'l',5) as instr_2,
       instr('hello, oracle!', 'l',2,2) as instr_3
       from dual;
       
--문자열 함수 : replace(찾아서 바꾸기)
select replace('이것이 oracle이다','이것이','This is')
from dual;

select '010-1234-5678' as replace_before,
replace('010-1234-5678','-',' ') as replace_1,
replace('010-1234-5678','-') as replace_2
from dual;

--문자열 함수 :concat(연결)
--empno, ename을 연결하여 조회
select concat(empno,ename), concat(empno,concat(':',ename))
from emp
where ename = 'SCOTT';

-- ||:연결의 의미로 사용됨
select empno || ename, empno || ':' ||ename
from emp
where ename = 'SCOTT';

--문자열 함수 : trim(공백제거),ltrim(왼쪽 공백 제거),rtrim(오른쪽 공백 제거)
select '    이것이    ', trim('    이것이    ')
from dual;

--문자열 함수 :reverse
select reverse('Oracle') from dual;

--2.숫자함수 :round(반올림),trunc(버림),ceil(입력된 숫자와 가까운 큰정수)
--           floor(입력된 숫자와 가까운 작은 정수),mod(나머지)

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

--3.날짜함수 : SYSDATE,CURRENT_DATE,CURRENT_TIMESTAMP
SELECT SYSDATE,CURRENT_DATE,CURRENT_TIMESTAMP from dual;
--날짜데이터는 연산이 가능함: 날짜데이터 +1,-1,날짜데이터 - 날짜데이터
--날짜데이터 + 날짜데이터는 안됨

select sysdate as now, sysdate-1 as yesterday,sysdate+1 as tomorrow
from dual;

--날짜함수: add_months
select sysdate,add_months(sysdate,3) from dual;

--입사10주년이 되는 사원들 조회
select empno,ename,hiredate, add_months(hiredate,120) from emp;

--압서 38년 미만인 사원 조회
select * from emp
where sysdate < add_months(hiredate,456);

--날짜함수 : months_between(두 날짜 사이의 차이)
select * from emp where months_between(sysdate,hiredate)< 456;

select empno, ename, hiredate, sysdate,months_between(hiredate,sysdate) as months1,
months_between(sysdate,hiredate) as months2, trunc(months_between(sysdate,hiredate))
from emp;

--날짜함수: next_day, last_day
select sysdate, next_day(sysdate,'월요일'),last_day(sysdate)
from dual;

--4. 형변환 함수 : to_char(날짜,숫자데이터를 문자로 변환),
--                to_number(문자데이터를 숫자로 변환),
--                to_date(문자데이터를 날짜로 변환)

select to_char(sysdate,'YYYY/MM/DD') as 현재날짜 from dual;
select to_char(sysdate,'MM') as 현재날짜 from dual;
select to_char(sysdate,'DD') as 현재날짜 from dual;
select to_char(sysdate,'mon') as 현재날짜 from dual;
select to_char(sysdate,'day') as 현재날짜 from dual;
select to_char(sysdate,'HH:MI:SS') as 현재날짜 from dual;
select to_char(sysdate,'HH12:MI:SS') as 현재날짜 from dual;
select to_char(sysdate,'AM HH24:MI:SS') as 현재날짜 from dual;
select to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') as 현재날짜시간 from dual;


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
       
-- 1981년 6월1일 이후에 입사한 사원정보 조회
select * 
from emp 
where hiredate > to_date('19810601','yyyy-mm-dd');

select to_date('2019-12-20')-to_date('2019-10-20') from dual;

--널처리함수 :nvl,nvl2
select empno, ename,sal, comm, sal+comm from emp;


select empno, ename,sal, comm, sal+comm,nvl(comm,0),sal+nvl(comm,0)
from emp;

select empno, ename,sal, comm, sal+comm,nvl2(comm,'o','x'),
sal+nvl2(comm,sal*12+comm,sal*12) as ammsal
from emp;

--decode함수와 case문
--job이  manager, salesman, analyst 경우에 각각의 다른 비율을 적용하고 싶다면?
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
                            when comm is null then '해당사항없음'
                            when comm=0 then '수당없음'
                            when comm>0 then '수당 : '|| comm
                            end as comm_text from emp;
