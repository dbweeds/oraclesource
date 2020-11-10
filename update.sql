create table dept_temp2 as select * from dept;

--dept_temp2  에있는 모든 loc모두수정
update dept_temp2 --테이블명
set loc = 'SEOUL';--수정할내용

select * from dept_temp2;

rollback;

update dept_temp2 --테이블명
set loc = 'SEOUL'--수정할내용
where deptno = 10;--업데이트 조건

--emp_temp 테이블의 사원들 중에서 급여가 3000 이하인 사원만 추가수당을 50으로 수정
update emp_temp
set comm = 50
where sal <= 3000;

--서브쿼리를 이용한 데이터 수정
--dept 의 30부서에 있는내용을 40번 부서의 부서명과 지역 수정
update dept_temp2
set(dname,loc) = (select dname,loc from dept where deptno=30)
where deptno=40;

update dept_temp2
set loc = 'SEOUL'
where deptno = (select deptno from dept where dname='OPERATIONS');

commit;






