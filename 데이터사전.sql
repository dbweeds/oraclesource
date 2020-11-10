--������ ����(data dictionary) : ������ ���̽� �޸�, ���� ,�����, ����, ��ü�� ���� ����Ŭ
--��� �ʿ��� �߿��� �����Ͱ� �����Ǵ� ���

--scott �������� ��� ������ ������ ����
select * from dict;

select * from user_tables;

select * from all_tables;

--�� : ���� ���̺�

create view vm_emp20 as (select empno, ename, job, deptno
                         from emp
                         where deptno = 20);

select * from vm_emp20;

-- �� Ȯ��                         
select * from user_views;

create view vm_emp30all as select * from emp;

--������ �並 ���ؼ� insert �۾�
insert into vm_emp30all values(7777,'KIM','JUNKI',null,'20/10/19',2650,null,20);

select * from vm_emp30all;
select * from emp;

--��� select�� �����ϵ��� ����(�б⸸����)
create view vm_emp_read as
    select empno,ename,job from emp with read only;

--������ �信 ������ �����Ѱ�?
select * from user_updatable_columns where table_name = 'VM_EMP30ALL';

select * from user_updatable_columns where table_name = 'VM_EMP_READ';

--�並 ����ϴ� ����
--����(���� ���̺��� ������ �ִ� �ΰ��� ���� ����)
select * from emp; --sal,comm

--��������,���ΰ� ���� ������ ���� ����� �����ؼ� ���

--�ε��� - �����̱� ������ select ���� ȿ���� ����

--scott ������ ������ �ε��� ���� ����
select * from user_indexes;

--�⺻Ű ���� => �ڵ� �ε����� ��

--�ε�������(emp ���̺��� sal ���� �ε��� ����)
create index idx_emp_sql on emp(sal);

select * from emp where sal=1250;
select * from emp where hiredate='81/02/22';

--
create table usertbl(
    uerid char(8) not null primary key,
    username nvarchar2(10) not null,
    birthyear number(4) not null,
    mobile char(3));

select index_name,uniqueness,index_type from user_indexes;

select * from user_indexes;
--�ε����� �Ժη� �����ȵǰ� ��������� �ε����� ����� ����� ����


--������ : Ư�� ��Ģ�� �´� ���� ���� ����
--      : ��ñ� ��ȣ, ��ǰ��ȣ,�ֹ���ȣ....
create sequence dept_seq --������ �̸�
increment by 10 --10�� ����
start with 10  --ó�� ���� ����
maxvalue 90    --������ ����
minvalue 0     --start ������ �۰� ����(�ּҰ�)
nocycle cache 2;--�ݺ����� ����, �̸� ������ ������ ����

create table dept_seq_tbl as select * from dept where 1<>1;

--�������� �̿��ؼ� ����
select * from dept_seq_tbl;
insert into dept_seq_tbl values(dept_seq.nextval,'DATABASE','SEOUL');

--������ ����
alter sequence dept_seq increment by 3 maxvalue 99 cycle;

--������ ����� ������ Ȯ���ϱ�
select dept_seq.currval from dual;

--synonym(���Ǿ�) : ���� ��Ī
--���̺�,��,������ �� ��ü�鿡�� ��� ����� �� �ִ� �̸� �ο�
create synonym e for emp;

select * from e;
--�ǽ�
drop table empidx;
create table empidx as select * from emp;

create index idx_empidx_empno on empidx(empno);

select * from user_indexes;

create view empidx_over15k as select empno, ename,job,deptno,sal,comm
                              from empidx where sal>1500;
select * from empidx_over15k;

create table deptseq as select * from dept where 1<>1;

create sequence deptseq_seq
                increment by 1 
                start with 1  
                maxvalue 99   
                minvalue 1   
                nocycle nocache;

select * from user_sequences;

insert into deptseq values(deptseq_seq.nextval,'DATABASE','SEOUL');
insert into deptseq values(deptseq_seq.nextval,'WEB','BUSAN');
insert into deptseq values(deptseq_seq.nextval,'MOBILE','ILSAN');

SELECT * FROM deptseq;

