--scott ���� ��ȣ ����/���� �����ϱ�
alter user scott identified by tiger account unlock;

--hr ���� ��ȣ ����/���� �����ϱ�
alter user hr identified by 12345 account unlock;

-- ������ ����
--dba_ : system,sys �� ��������(db������ ���� ����)
select * from dba_tables;

--scott ���� create view ���� �ο�
--dcl
grant create view to scott;

--scott ���� create synonym,create public synonym ���Ѻο�
grant create synonym to scott;
grant create public synonym to scott;

--���ο� ����� ����(= ���ο� ��Ű�� ����)
create user test identified by 12345;

-- ���� ���� �ο�(�������� �ο�)
grant create session to test;

-- ���� �۾��� ������ �������ִ� �� �ο�
grant connect, resource to test;

--test2 ����� ����(�ƹ� ������ ���� ����� ����)
create user test2 identified by 12345;
--���� �ο�
grant create session to test2;

grant create table to test2;

--���� ���
revoke create table from test2;

--��� ���� �ο�
grant connect, resource to test2;

--��й�ȣ ����
alter user test2 identified by 54321;
--����� ����
--drop user test2(����ڰ� ���� ��ü�� �ƹ��͵� ������)
drop user test2;
--����� ���� cascade( ����ڿ� ��ü(���̺�,index,view..)��� ����)
drop user test2 cascade;

--�������� ����� ����� ����
create user javadb identified by 12345;
grant connect,resource to javadb;

<<<<<<< HEAD
create user EmployeeDB identified by 12345;
grant connect,resource to EmployeeDB;
=======


create user employeedb identified by 12345;
grant connect,resource to employeedb;
>>>>>>> 82c66c2145d27d468a76f8d81b04cc20be240e5e
