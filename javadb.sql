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
values(userTBL_seq.nextval,'ȫ�浿',1955,'����','010-1234-5678');
insert into userTBL 
values(userTBL_seq.nextval,'������',1965,'�λ�','010-0234-5678');
insert into userTBL 
values(userTBL_seq.nextval,'�ս¿�',1975,'��õ','010-0034-5678');
insert into userTBL 
values(userTBL_seq.nextval,'�ŵ���',1985,'���','010-0004-5678');
insert into userTBL 
values(userTBL_seq.nextval,'�輮ȣ',1995,'�뱸','010-0000-5678');
select * from usertbl;

commit;