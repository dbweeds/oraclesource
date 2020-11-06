--sum : 합계
select sum(sal), sum(distinct sal),sum(all sal) from emp;

--count : 개수
select count(*) from emp;

--부서번호가 30번인 직원 수 구하기
select count(*) from emp where deptno =30;

select count(sal), count(distinct sal),count(all sal) from emp;

--max(최대값),min(최소값)
select max(sal), min(sal) from emp;

--부서번호가 20인 사원의 입사일중 가장최근 입사일 구하기
select  max(hiredate) from emp where deptno = 20;

--average : 평균
select avg(sal) from emp;
select avg(sal) from emp where deptno = 30;
select avg(distinct sal) from emp;

--부서별 월금의 평균을 알고싶다면?
select avg(sal) from emp where deptno = 10;
select avg(sal) from emp where deptno = 20;
select avg(sal) from emp where deptno = 30;

--group by : 결과값을 원하는 열로 묶어 출력
select deptno,avg(sal) from emp group by deptno;

--부서번호별 추가수당 평균 구하기
select deptno,avg(comm) from emp group by deptno;

--부서번호, 직책별 급여 평균 구하기
select deptno, avg(sal),job from emp group by deptno,job order by deptno,job;

--group by절에 포함 안되는 열을 select에 포함하면 안됨
select ename,deptno,avg(sal)
from emp
GROUP BY deptno;