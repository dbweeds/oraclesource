create table dept_tcl as select * from dept;

insert into dept_tcl VALUES(50,'DATABASE','SEOUL');

commit;

select * from dept_tcl;

rollback;

--하나의 트랜잭션 생성
insert into dept_tcl values(60,'NETWORK','BUSAN');
update dept_tcl set loc = 'SEOUL' where deptno = 40;
delete from dept_tcl where dname = 'RESERACH';
select * from dept_tcl;

commit;