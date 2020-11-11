--scott 계정 암호 지정/계정 해제하기
alter user scott identified by tiger account unlock;

--hr 계정 암호 지정/계정 해제하기
alter user hr identified by 12345 account unlock;

-- 데이터 사전
--dba_ : system,sys 만 볼수있음(db관리를 위한 정보)
select * from dba_tables;

--scott 에게 create view 권한 부여
--dcl
grant create view to scott;

--scott 에게 create synonym,create public synonym 권한부여
grant create synonym to scott;
grant create public synonym to scott;

--새로운 사용자 생성(= 새로운 스키마 생성)
create user test identified by 12345;

-- 접속 권한 부여(개별권한 부여)
grant create session to test;

-- 여러 작업의 권한을 가지고있는 롤 부여
grant connect, resource to test;

--test2 사용자 생성(아무 권한이 없는 사용자 생성)
create user test2 identified by 12345;
--권한 부여
grant create session to test2;

grant create table to test2;

--권한 취소
revoke create table from test2;

--모든 권한 부여
grant connect, resource to test2;

--비밀번호 변경
alter user test2 identified by 54321;
--사용자 삭제
--drop user test2(사용자가 가진 객체가 아무것도 없을때)
drop user test2;
--사용자 삭제 cascade( 사용자와 객체(테이블,index,view..)모두 삭제)
drop user test2 cascade;

--수업에서 사용할 사용자 생성
create user javadb identified by 12345;
grant connect,resource to javadb;

<<<<<<< HEAD
create user EmployeeDB identified by 12345;
grant connect,resource to EmployeeDB;
=======


create user employeedb identified by 12345;
grant connect,resource to employeedb;
>>>>>>> 82c66c2145d27d468a76f8d81b04cc20be240e5e
