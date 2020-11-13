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
insert into member values(member_seq.nextval,'홍길동','서울시 강남구','qwert1@naver.com','미국',20);
insert into member values(member_seq.nextval,'김남길','서울시 강남구','qwert2@naver.com','한국',22);
insert into member values(member_seq.nextval,'홍영이','경기도 구리시','qwert3@naver.com','중국',24);
insert into member values(member_seq.nextval,'박오진','서울시 양천구','qwert4@naver.com','영욱',26);
insert into member values(member_seq.nextval,'김길동','서울시 서초구','qwert5@naver.com','일본',27);



select * from member;

commit;