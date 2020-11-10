-- 존스의 급여보다 높은 급여를 받는 사원들 출력하기

--존스의 급여 알아내기
select sal from emp where ename='JONES';

--높은 급여 사원출력하기
select * from emp where sal>2975;

--서브쿼리 : 쿼리문 안에 다른 쿼리문을 포함하고 있는 상태
--단일 행 서브쿼리 : >,<,=,>=,<=, 같지않음 : <>,^=,!=
select * from emp where sal > (select sal from emp where ename='JONES');

--사원이름이 ALLEN 인 사원의 추가수당보다 많이 받는 사원을 출력
select * from emp where comm > (select comm from emp where ename='ALLEN');

--사원이름이 WARD 인 사원의 입사일보다 빨리 입사한 사원을 출력
select * from emp where hiredate < (select hiredate from emp where ename='WARD');

--20번 부서에 속한 사원중 전체 사원의 형균급여보다 높은 급여를 받는 사원출력
select * from emp where deptno = 20 and sal > (select avg(sal) from emp);

select * from dept;
--20번 부서에 속한 사원중 전체 사원의 형균급여보다 높은 급여를 받는 사원출력
--부서명, 지역위치
select e.* , d.dname , d.loc
from emp e inner join dept d
on e.deptno = d.deptno and
d.deptno = 20 and sal > (select avg(sal) from emp);

--다중행 서브쿼리

--서브쿼리 결과가 2개이상 나오는 경우라면 단일행 서브쿼리의 연산자 사용불가
--단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
--select * from emp where sal >= (select max(sal) from emp group by deptno);
select max(sal) from emp group by deptno;
--in
select * from emp where sal in (select max(sal) from emp group by deptno);

--any(some)

-- = any : in 의 수행결과와 같게 나옴, 단, in을 더 많이 사용
select * from emp where sal = any (select max(sal) from emp group by deptno);

select * from emp where sal = some (select max(sal) from emp group by deptno);

--30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 출력
select * from emp where sal < any (select max(sal) from emp where deptno = 30);


select distinct sal from emp where deptno = 30;
select * from emp where sal < any (select sal from emp where deptno = 30);

--30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 출력
select * from emp where sal > any (select sal from emp where deptno = 30);


--all : 서브 쿼리의 결과를 모두 만족하는 메인 쿼리를 추출할때
--부서번호가30번인 사원들의 최소 급여보다 더 적은 급여를 받는 사원 출력
select * from emp where sal < all (select sal from emp where deptno = 30);

--exists : in 과 비슷한 개념, 단 in보다 성능이 우수
--서브쿼리 결과가 존재하면 메인쿼리 결과도 출력

select * from emp where exists (select dname from dept where deptno = 20);
select * from emp where not exists (select dname from dept where deptno = 20);


select empno,deptno
from emp
where exists (select deptno 
              from dept 
              where deptno in (20,30) and emp.deptno = dept.deptno);
              
select empno,deptno
from emp
where exists (select 1
              from dept 
              where deptno in (20,30) and emp.deptno = dept.deptno);
              
select empno,deptno
from emp
where not exists (select 1
              from dept 
              where deptno in (20,30) and emp.deptno = dept.deptno);

select job,empno,ename,sal,e.deptno,dname
from emp e ,dept d
where e.deptno = d.deptno and
job = (select job
       from emp
       where ename = 'ALLEN' );

SELECT * FROM emp;
SELECT * FROM salgrade;
SELECT * FROM dept;

select empno,ename,dname,hiredate,loc,sal,grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno 
and e.sal BETWEEN s.losal and s.hisal
and sal > all (select avg(sal) from emp)
order by sal DESC,empno;


--다중 열 서브쿼리 : 서브쿼리의 selext문에 비교할 컬럼이 여러개 나오는 방식
select * from emp where (deptno, sal) in (select deptno,max(sal) from emp group by deptno);

--from 절에 사용하는 서브 쿼리(인라인 뷰)
select e.empno, e.ename,d.deptno, d.dname, d.loc
from(select * from emp where deptno = 10) e,(select * from dept) d
where e.deptno = d.deptno;

--select 절에 사용하는 서브쿼리 - 스칼라 서브쿼리


select e.empno, e.ename,d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
and e.job not in(select distinct job
               from emp
               where deptno = 30)
and e.deptno = 10;

select empno,ename, sal, (select grade from salgrade where e.sal between losal and hisal) as grade
from emp
where sal> (select max(sal) from emp where job='SALESMAN');

select empno,ename, sal
from emp
where sal > all(select max(sal) from emp where job='SALESMAN');
