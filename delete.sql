create table emp_temp2 as select * from emp;

select * from emp_temp2;

--job �� manager�� ������ �����ϱ�
delete from emp_temp2 where job='MANAGER';

rollback;

delete emp_temp2;

--emp_temp2 ���̺��� ����߿��� �޿��� 5000�̻��� ��� ����
delete from emp_temp2 where sal>=5000;

commit;
















