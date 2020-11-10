-- 회원가입, 게시글 등록,입금....

--기존의 dept 테이블을 복사해서 dept_temp테이블 생성
create table DEPT_TEMP as select * from dept;

--현재 테이블 조회
select * from dept_temp;

--데이터 추가하기(방법 1)
insert into dept_temp(deptno, dname,loc) values(50,'DATABASE','SEOUL');

--데이터 추가하기(방법 2)
insert into dept_temp values(60,'NETWORK','BUSAN');

-- 에러발생
--insert into dept_temp(deptno, dname,loc) values(50,'DATABASE');
--insert into dept_temp(deptno, dname,loc) values(500,'DATABASE','SEOUL');

--null삽입하기
--명시적으로 null 삽입
insert into dept_temp(deptno, dname,loc) values(70,'DATABASE',null);
insert into dept_temp(deptno, dname,loc) values(80,'MOBILE','');

--묵시적으로 null 삽입
insert into dept_temp(deptno,loc) values(90,'INCHEON');

--emp테이블을 복사하여 emp_temp 테이블 생성
create table EMP_TEMP as select * from emp;

--테이블 삭제
drop table emp_temp;

--emp테이블을 복사하여 emp_temp 테이블 생성하되 구조만 복사하기
create table EMP_TEMP as select * from emp where 1<>1;
select * from emp_temp;

desc emp_temp;
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(9999,'홍길동','PRESIDENT',null,'2020/11/09',4000,null,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(8888,'성춘향','MANAGER',null,'2020/10/08',3000,null,10);

--dml(데이터 조작어)-> select,update,delete,insert->커밋(최종반영), rollback(다시 되돌리기)
--트랜잭션 : 커밋과 롤백

--최종반영
COMMIT;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(7777,'유승화','MANAGER',null,to_date('07/01/2010','dd/mm/yyyy'),4000,null,20);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(6666,'이순신','MANAGER',null,sysdate,4000,null,20);

--emp테이블에서 salfrade테이블을 참조하여 급여 등급이 1등급인 사원만을
--emp_temp 테이블에 추가하기
--서브쿼리로 작성(데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치)
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
select empno,ename,job,mgr,hiredate,sal,comm,deptno 
from emp e ,salgrade s where e.sal between s.losal and s.hisal and s.grade = 1;

select * from emp_temp;













