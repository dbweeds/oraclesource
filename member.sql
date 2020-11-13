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
insert into member values(member_seq.nextval,'ȫ�浿','����� ������','qwert1@naver.com','�̱�',20);
insert into member values(member_seq.nextval,'�賲��','����� ������','qwert2@naver.com','�ѱ�',22);
insert into member values(member_seq.nextval,'ȫ����','��⵵ ������','qwert3@naver.com','�߱�',24);
insert into member values(member_seq.nextval,'�ڿ���','����� ��õ��','qwert4@naver.com','����',26);
insert into member values(member_seq.nextval,'��浿','����� ���ʱ�','qwert5@naver.com','�Ϻ�',27);



select * from member;

commit;