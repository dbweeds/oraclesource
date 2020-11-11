drop table userTBL;
create table userTBL(
    no number(8) constraint pk_userTBL primary key,
    userName nchar(4) not null,
    birthYear number(4) not null,
    addr nchar(2) not null,
    mobile nvarchar2(13));


create sequence userTBL_seq;
drop sequence userTBL_seq;

insert into userTBL 
values(userTBL_seq.nextval,'홍길동',1955,'서울','010-1234-5678');
insert into userTBL 
values(userTBL_seq.nextval,'김지우',1965,'부산','010-0234-5678');
insert into userTBL 
values(userTBL_seq.nextval,'손승연',1975,'인천','010-0034-5678');
insert into userTBL 
values(userTBL_seq.nextval,'신동완',1985,'경기','010-0004-5678');
insert into userTBL 
values(userTBL_seq.nextval,'김석호',1995,'대구','010-0000-5678');
select * from usertbl;

commit;