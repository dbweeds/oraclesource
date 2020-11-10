create table emp_temp2 as select * from emp;

select * from emp_temp2;

--job 이 manager인 데이터 삭제하기
delete from emp_temp2 where job='MANAGER';

rollback;

delete emp_temp2;

--emp_temp2 테이블의 사원중에서 급여가 5000이상인 사원 삭제
delete from emp_temp2 where sal>=5000;

commit;
















