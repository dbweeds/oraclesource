create table test(
    id number(4),
    name varchar2(3));
desc test;

--한글은 글자 하나당 2byte로 처리
insert into test values(1000,'홍길동');
--영어는 글자 하나당 1byte로 처리
insert into test values(1000,'ABC');

--언어마다 서로 다른 byte처리를 보완하기 위해 nchar,nvarchar2
drop table test2;
--nchar,nvarchar2 차이 : 고정된 길이를 항상 가지고 있는냐 아니냐 차이
--nchar경우에는 글자가 1만 입력이 되도 4자리를 항상 유지
create table test2(
    id nchar(4),
    name nvarchar2(3));
desc test2;
insert into test2 values('황보강성','홍길동');

create table test3(
    id nvarchar2(4),
    name nvarchar2(4),
    reg_date date);

insert into test3 values('황보강성','홍길동',sysdate);
insert into test3 values('황보강성','홍길동','2020-11-09');
desc test3;

--테이블 생성하기
--create table 테이블명(열이름 타입, .....);
--create table 테이블명 as select * from emp;
--create table 테이블명 as select * from emp where 조건;
--create table 테이블명 as select * from emp where 1<>1;(구조만 복제)

desc emp;

create table emp_ddl(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4), 
    HIREDATE DATE,  
    SAL NUMBER(7,2),-- 전체 자릿수는 7자리(소수점2자리를 포함할 수 있음)
    COMM NUMBER(7,2),--12345.78
    DEPTNO NUMBER(2));

--alter : 테이블 수정

--컬럼 추가
alter table emp_ddl add hp varchar2(20);

--기존 컬럼명 변경
alter table emp_ddl rename COLUMN hp to tel;

--기존 타입 변경
alter table emp_ddl modify empno number(5);

--기존 컬럼 삭제
alter table emp_ddl drop column tel;

--테이블명 변경
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