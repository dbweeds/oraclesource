create table dept_tcl as select * from dept;

insert into dept_tcl VALUES(50,'DATABASE','SEOUL');

commit;

select * from dept_tcl;

rollback;

--�ϳ��� Ʈ����� ����
insert into dept_tcl values(60,'NETWORK','BUSAN');
update dept_tcl set loc = 'SEOUL' where deptno = 40;
delete from dept_tcl where dname = 'RESERACH';
select * from dept_tcl;

commit;