create table dept_temp2 as select * from dept;

--dept_temp2  ���ִ� ��� loc��μ���
update dept_temp2 --���̺��
set loc = 'SEOUL';--�����ҳ���

select * from dept_temp2;

rollback;

update dept_temp2 --���̺��
set loc = 'SEOUL'--�����ҳ���
where deptno = 10;--������Ʈ ����

--emp_temp ���̺��� ����� �߿��� �޿��� 3000 ������ ����� �߰������� 50���� ����
update emp_temp
set comm = 50
where sal <= 3000;

--���������� �̿��� ������ ����
--dept �� 30�μ��� �ִ³����� 40�� �μ��� �μ���� ���� ����
update dept_temp2
set(dname,loc) = (select dname,loc from dept where deptno=30)
where deptno=40;

update dept_temp2
set loc = 'SEOUL'
where deptno = (select deptno from dept where dname='OPERATIONS');

commit;






