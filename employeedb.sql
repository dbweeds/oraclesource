create table employee(
    no number constraint pk_employee PRIMARY key,
    name NVARCHAR2(5) not null,
    sex NVARCHAR2(3) not null,
    telno NVARCHAR2(15) ,
    birthday date not null,
    address NVARCHAR2(50) ,
    email NVARCHAR2(30) ,
    pay number(5) ,
    position NVARCHAR2(3),
    id varchar2(15) not null,
    passward VARCHAR2(15) not null
);
create table employeemanager(
    id nvarchar2(15) constraint pk_employeemanager PRIMARY key,
    name NVARCHAR2(5) not null,
    passward VARCHAR2(15) not null
);
create SEQUENCE employee_seq;

select * from employee;

commit;