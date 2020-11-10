--데이터 사전(data dictionary) : 데이터 베이스 메모리, 성능 ,사용자, 권한, 객체와 같은 오라클
--운영에 필요한 중요한 데이터가 보관되는 장소

--scott 계정에서 사용 가능한 데이터 사전
select * from dict;

select * from user_tables;

select * from all_tables;

--뷰 : 가상 테이블

create view vm_emp20 as (select empno, ename, job, deptno
                         from emp
                         where deptno = 20);

select * from vm_emp20;

-- 뷰 확인                         
select * from user_views;

create view vm_emp30all as select * from emp;

--생성된 뷰를 통해서 insert 작업
insert into vm_emp30all values(7777,'KIM','JUNKI',null,'20/10/19',2650,null,20);

select * from vm_emp30all;
select * from emp;

--뷰는 select만 가능하도록 생성(읽기만가능)
create view vm_emp_read as
    select empno,ename,job from emp with read only;

--생선된 뷰에 수정이 가능한가?
select * from user_updatable_columns where table_name = 'VM_EMP30ALL';

select * from user_updatable_columns where table_name = 'VM_EMP_READ';

--뷰를 사용하는 목정
--보안(원본 테이블이 가지고 있는 민감한 정보 제한)
select * from emp; --sal,comm

--서브쿼리,조인과 같은 복잡한 쿼리 결과를 저장해서 사용

--인덱스 - 색인이기 때문에 select 문에 효능을 높임

--scott 계정이 소유한 인덱스 정보 보기
select * from user_indexes;

--기본키 생성 => 자동 인덱스가 됨

--인덱스생성(emp 데이블의 sal 열에 인덱스 생성)
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
--인덱스를 함부로 만들면안되고 어느정도의 인덱스를 만드는 방법이 존재


--시퀀스 : 특정 규칙에 맞는 연속 숫자 생성
--      : 계시글 번호, 상품번호,주문번호....
create sequence dept_seq --시퀀스 이름
increment by 10 --10씩 증가
start with 10  --처음 시작 숫자
maxvalue 90    --마지막 숫자
minvalue 0     --start 값보다 작게 설정(최소값)
nocycle cache 2;--반복하지 않음, 미리 생성할 것인지 여부

create table dept_seq_tbl as select * from dept where 1<>1;

--시퀀스를 이용해서 삽입
select * from dept_seq_tbl;
insert into dept_seq_tbl values(dept_seq.nextval,'DATABASE','SEOUL');

--시퀀스 수정
alter sequence dept_seq increment by 3 maxvalue 99 cycle;

--마지막 발행된 시퀀스 확인하기
select dept_seq.currval from dual;

--synonym(동의어) : 공식 별칭
--테이블,뷰,시퀀스 등 객체들에게 대신 사용할 수 있는 이름 부여
create synonym e for emp;

select * from e;
--실습
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

