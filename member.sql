create table member(
    id number primary key,
    name varchar2(10) unique not null,
    addr varchar2(50) not null,
    email varchar2(30) not null,
    nation varchar2(12) not null,
    age number null
);
drop table member;
create SEQUENCE member_seq;
drop SEQUENCE member_seq;
insert into member values(
member_seq.nextval,'홍길동','서울시 강남구','qwert@naver.com','미국',20);

select * from member;

commit;