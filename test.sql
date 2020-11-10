--제약조건
--1.not null
create table table_notnull(
    login_id varchar2(20) not null,
    login_pwd varchar2(20) not null,
    tel varchar2(20));
    
insert into table_notnull(login_id,login_pwd) 
            values('hong1234','hong1234');

insert into table_notnull(login_id,login_pwd) 
            values('kong1234',null);
            
update table_notnull set login_pwd = null where login_id ='hong1234';

select * from table_notnull;

--제약조건 확인하기
select * from user_constraints;

--제약조건명 지정하기
create table table_notnull2(
    login_id varchar2(20) CONSTRAINT tbl_nn_lgind_nn not null ,
    login_pwd varchar2(20) CONSTRAINT tbl_nn_lgpwd_nn not null,
    tel varchar2(20));
    
--제약조건 추가
alter table table_notnull2 modify(tel not null);
alter table table_notnull2 modify(tel CONSTRAINT tbl_nn_tel_nn not null);--이미 전에 낫널을 걸어놔서 불가 낫널이안걸렸을때 이렇게도 이름주면서 가능
-- 제약조건 이름 변경
alter table table_notnull2 rename CONSTRAINT sys_c0011064 to tbl_nn_tel_nn;

--제약조건 삭제(tbl_nn_tel_nn 아예 삭제)
alter table table_notnull2 drop constraint tbl_nn_tel_nn;

update table_notnull set tel = '010-1111-1111' where login_id = 'hong1234';
alter table table_notnull modify(tel not null);

--2.unique : 중복되지 않는 값

create table table_unique(
    login_id varchar2(20) unique,
    login_pwd varchar2(20) not null,
    tel varchar2(20));

insert into table_unique(login_id, login_pwd,tel)
values('TEST_ID01','PWD01','010-1234-5678');

insert into table_unique(login_id, login_pwd,tel)
values('TEST_ID02','PWD01','010-1234-5678');

select * from table_unique;

select * from user_constraints;

create table table_unique2(
    login_id varchar2(20) constraint tblunq2_lgnid_unq unique,
    login_pwd varchar2(20) constraint tblunq2_lgnpwd_nn not null,
    tel varchar2(20));
    
--3. primary key(not null +unique) : 기본키
create table table_pk(
    login_id varchar2(20)  primary KEY,
    login_pwd varchar2(20) not null,
    tel varchar2(20));
    
select * from user_constraints;

insert into table_pk(login_id, login_pwd,tel)
values('TEST_ID01','PWD01','010-1234-5678');

insert into table_pk(login_id, login_pwd,tel)
values(null,'PWD01','010-1234-5678');

create table table_pk2(
    login_id varchar2(20) CONSTRAINT tblpk_logid_pk primary KEY,
    login_pwd varchar2(20)  not null,
    tel varchar2(20));

--제약조건만 모아서 주기(notnull 은 모아서 선언을 못함)
create table table_constraint(
    id number(6),
    name varchar2(10),
    addr varchar2(20),
    tel varchar2(20),
    constraint tbl_id_pk primary key(id),
    constraint tbl_tel_unq unique(tel)
);

--4. foreign key(외래키): 서로 다른 테이블 간 관계 정의
create table dept_fk(
    deptno number(2) constraint deptfk_deptno_pk primary key,
    dname varchar2(14),
    loc varchar2(13));
    
create table emp_fk(
    empno number(4) constraint empfk_empno_pk primary key, 
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2) constraint empfk_deptno_fk references dept_fk(deptno));

insert into dept_fk
VALUES(50,'DATABASE','SEOUL');
--인서트는 부모를먼저(fk)를 먼저 만들어줘야 자식을 인서트할수있다
insert into emp_fk 
values(1111,'홍길동','clerk','7788','2019-02-13',1200,null,50);

--델리트는 자식(pk)를 먼저해줘야 부모를 델리트할수있다
delete from dept_fk where deptno=50;

drop table emp_fk;

select * from emp_fk;
--delete cascade 를 테이블만들때 조건을 걸어놔줘야 부모키가 제거될때 자식키도 같이 제거
create table emp_fk(
    empno number(4) constraint empfk_empno_pk primary key, 
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2) constraint empfk_deptno_fk 
    references dept_fk(deptno) on delete cascade);
--on delete cascade :부모키가 제거될때 자식키도 같이 제거
--on delete set null :부모키가 제거될때 자식키의 값은 null로 변경
create table emp_fk(
    empno number(4) constraint empfk_empno_pk primary key, 
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2) constraint empfk_deptno_fk 
    references dept_fk(deptno) on delete set null);

--5. check : 열에 저장할 수 있는 값의 범위 또는 패턴 정의

create table table_check(
    login_id varchar2(20) constraint tblck_logid_pk primary key,
    login_pwd varchar2(20) constraint tblck_logpd_ck check (length(login_pwd)>3),
    tel varchar2(20));

insert into table_check values('TEST_ID','1234','010-1234-5678');

SELECT * FROM table_check;

--6. default : 기본값 정하기
create table table_default(
    login_id varchar2(20) constraint tbldf_logid_pk primary key,
    login_pwd varchar2(20) default '1234',
    tel varchar2(20));

desc table_default;

insert into table_default values('TEST_ID',null,'010-1234-5678');
insert into table_default values('TEST_ID2','4567','010-1234-5678');
insert into table_default(login_id, tel) values('TEST_ID3','010-1234-5678');
select * from table_default;




















































