

create table employee(
    no number(8) constraint pk_employee primary key,
    name nvarchar2(5),
    sex nvarchar2(3),
    birthday date,
    address nvarchar2(40),
    email nvarchar2(30),
    pay number(6),
    pos nvarchar2(3),
    passward nvarchar2(20));

create sequence employee_seq;
select * from employee;

commit;