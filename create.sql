create table test(
    id number(4),
    name varchar2(3));
desc test;

--�ѱ��� ���� �ϳ��� 2byte�� ó��
insert into test values(1000,'ȫ�浿');
--����� ���� �ϳ��� 1byte�� ó��
insert into test values(1000,'ABC');

--���� ���� �ٸ� byteó���� �����ϱ� ���� nchar,nvarchar2
drop table test2;
--nchar,nvarchar2 ���� : ������ ���̸� �׻� ������ �ִ³� �ƴϳ� ����
--nchar��쿡�� ���ڰ� 1�� �Է��� �ǵ� 4�ڸ��� �׻� ����
create table test2(
    id nchar(4),
    name nvarchar2(3));
desc test2;
insert into test2 values('Ȳ������','ȫ�浿');

create table test3(
    id nvarchar2(4),
    name nvarchar2(4),
    reg_date date);

insert into test3 values('Ȳ������','ȫ�浿',sysdate);
insert into test3 values('Ȳ������','ȫ�浿','2020-11-09');
desc test3;

--���̺� �����ϱ�
--create table ���̺��(���̸� Ÿ��, .....);
--create table ���̺�� as select * from emp;
--create table ���̺�� as select * from emp where ����;
--create table ���̺�� as select * from emp where 1<>1;(������ ����)

desc emp;

create table emp_ddl(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4), 
    HIREDATE DATE,  
    SAL NUMBER(7,2),-- ��ü �ڸ����� 7�ڸ�(�Ҽ���2�ڸ��� ������ �� ����)
    COMM NUMBER(7,2),--12345.78
    DEPTNO NUMBER(2));

--alter : ���̺� ����

--�÷� �߰�
alter table emp_ddl add hp varchar2(20);

--���� �÷��� ����
alter table emp_ddl rename COLUMN hp to tel;

--���� Ÿ�� ����
alter table emp_ddl modify empno number(5);

--���� �÷� ����
alter table emp_ddl drop column tel;

--���̺�� ����
rename emp_ddl to emp_rename;
desc emp_rename;

create table member(
    id char(8),
    name nvarchar2(10),
    addr nvarchar2(50),
    nation nchar(4),
    email varchar2(50),
    age number(7,2));
drop table member;

alter table member add bigo varchar2(20);
alter table member modify bigo varchar2(30);
alter table member rename COLUMN bigo to remark;
desc member;