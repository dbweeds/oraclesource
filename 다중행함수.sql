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
/*select ename,deptno,avg(sal)
from emp
GROUP BY deptno;
*/

--having : group by 정에 조건을 줄때 사용
--각 부서의 직책별 평균 급여을 구하되 그평균 급여가 2000 이상인 그룹만
--출력
--where절에 그룹함수가 들어올수없음
select deptno,job,avg(sal) from emp 
group by deptno,job 
having avg(sal)>2000
order by deptno,job;

--emp테이블의 부서별 직책의 평균 급여가 500이상인 사원들의ㅏ
--부서번호,직책,부서별 직팩의 평균 급여 출력
select deptno,job,avg(sal)
from emp
group by deptno,job having avg(sal) >=500;

--실행순서 from >select >where >group
select deptno,job,avg(sal)
from emp
where sal<=3000
group by deptno,job having avg(sal) >=500
order by deptno,job;

--조인
--나올수있는 모든 조합 조회
select * from emp,dept order by empno;
select count(*) from emp,dept order by empno;


select *from dept;--4행
select * from emp;--14행

--1) 내부조인(등가조인)
select * 
from emp,dept
where emp.deptno = dept.deptno
order by empno;

select * 
from emp E, dept D
where E.deptno = D.deptno
order by empno;

select * 
from emp inner join dept 
on emp.deptno = dept.deptno--조인기준
order by empno;

select * 
from emp e inner join dept d 
on e.deptno = d.deptno--조인기준
order by empno;

--두 테이블에 같은 이름의 필드가 존재하는 경우
-- 어느 테이블에 있는 필드를 가지고 올것인지 정확히 명시
select empno,ename,job,d.deptno,dname 
from emp E, dept D
where E.deptno = D.deptno
order by empno;

--emp테이블과 dept 테이블을 조인하여 enpno, ename, sal, deptno,
--dname, loc 를 조회한다. 단, 급여가 3000 이상인 사원만 출력
select e.empno, e.ename, e.sal, d.deptno,d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and sal>=3000;

--emp 체이블의 별칭을 e로 ,dept 테이블 별칭을 d로 하여
--급여가 2500 이하이고, 사원번호가 9999 이하인 사원의 정보를 출력
select *
from emp e, dept d
where e.deptno = d.deptno and e.sal<=2500 and e.empno <=9999;

--emp 체이블의 별칭을 e로 ,salfrade 테이블 별칭을 s로 하여
--각 사원의 정보와 더불어 사원의 등급 정보를 출력
select *
from salgrade;

select e.*, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal > s.losal and e.sal < hisal;

--2)셀프조인(자체조인) : 조인테이블이 자기 자신 테이블일때
select * from emp;

select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1,emp e2
where e1.mgr = e2.empno;

--outer join(외부조인) : 조건을 만족하지 않는 데이터 추출

--1)left outer join
select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1 left outer join emp e2
on e1.mgr = e2.empno;

select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1,emp e2
where e1.mgr = e2.empno(+);

--2)right outer join
select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1 right outer join emp e2
on e1.mgr = e2.empno;

select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1,emp e2
where e1.mgr(+) = e2.empno;

--3)full outer join
select e1.empno, e1.ename, e1.mgr,e2.empno as mgi_empno,e2.ename as mgr_ename
from emp e1 FULL outer join emp e2
on e1.mgr = e2.empno;

select *from dept;

SELECT e.deptno, d.dname,e.empno, e.empno, e.sal
FROM emp e inner join dept d
on e.deptno = d.deptno
order by e.deptno;

SELECT E.deptno, d.dname,floor(avg(sal)),max(sal),min(sal),count(*)
FROM emp e inner join dept d
on e.deptno = d.deptno
group by d.deptno ,d.dname
order by e.deptno;

SELECT d.deptno, d.dname,e.empno,e.ename,e.job, e.sal
FROM emp e right outer join dept d
on e.deptno = d.deptno
order by e.deptno;

SELECT e1.deptno,d.dname,e1.empno,e1.ename,e1.mgr,e1.sal,
       d.deptno,s.losal,s.hisal,s.grade,e1.mgr,e1.ename
FROM dept d,emp e1 ,salgrade s,emp e2
where e1.deptno(+) = d.deptno 
and e1.sal >= s.losal(+) and e1.sal <= s.hisal(+)
and e1.mgr = e2.empno(+)
order by d.deptno, e1.deptno;

SELECT d1.deptno,d1.dname,e1.empno,e1.ename,e1.mgr,
       e1.sal,d1.deptno,losal,hisal,grade,e1.mgr,e1.ename
from emp e1
right outer join dept d1 on e1.deptno = d1.deptno
left OUTER join salgrade s on e1.sal between s.losal and s.hisal
left outer join emp e2 on e1.mgr = e2.empno
order by d1.deptno,e1.empno;

select *
from dept;