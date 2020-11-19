--���� ����� ȭ�鿡 ���
set SERVEROUTPUT on;

begin
    dbms_output.put_line('Hello PL/SQL');
end;
/

--����
DECLARE 
    --��������: ������ Ÿ�� ;
    --         ������ Ÿ�� := ��;
    v_empno number(4):= 7788;
    v_ename varchar2(10);
begin
    v_ename := 'SCOTT';
    dbms_output.put_line('v_empno : '|| v_empno);
    dbms_output.put_line('v_ename : '|| v_ename);
end;
/

--���
DECLARE
    v_tax constant number(1) := 3;
BEGIN
    dbms_output.put_line('V_TAX : '||v_tax);
end;
/

--������ �⺻�� ����
DECLARE
    v_deptno number(2) DEFAULT 10;
BEGIN
    dbms_output.put_line('V_DEPTNO : '|| v_deptno);
end;
/

--������ null �� ���� ����
DECLARE
  v_deptno number(2) not null :=10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '|| v_deptno);
end;
/
--depalut + not null
DECLARE
  v_deptno number(2) not null default 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '|| v_deptno);
end;
/

--�ڷ���
--��Į���� : ����Ŭ �����ͺ��̽����� ����ϴ� �ڷ��� + Boolean
--������ : �ٸ� ���̺��� �÷� �ڷ����̳�, �ϳ��� �� ������ ����

--Ư�� ���̺��� �÷� �ڷ��� ����
DECLARE
    --dept ���̺��� deptno�� ���� �ڷ��� ���
    v_deptno dept.deptno%type := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '||v_deptno);
end;
/

DECLARE
    --dept ���̺��� ������ ���� �ڷ��� ���
    v_dept_row dept%rowtype;
BEGIN
    select deptno,dname,loc into v_dept_row
    from dept;
    if v_dept_row.deptno =10 then
    DBMS_OUTPUT.PUT_LINE('Dname : '|| v_dept_row.dname);
   end if;

end;
/


--���ǹ�

--if
DECLARE
    v_number number := 13;
BEGIN
    if mod(v_number,2) = 1 then
        dbms_output.put_line('V_NUMBER Ȧ��');
    end if;
end;
/

--if ~else
DECLARE
    v_number number := 984273984792837498272;
BEGIN
    if mod(v_number,2) = 1 then
        dbms_output.put_line('V_NUMBER Ȧ��');
    ELSE
        dbms_output.put_line('V_NUMBER ¦��');
    end if;
end;
/

--if~elsif~else
DECLARE
    v_score number := 87;
begin
    if v_score >= 90 then
        dbms_output.put_line('A');
    elsif v_score >= 80 then
        dbms_output.put_line('B');
    elsif v_score >= 70 then
        dbms_output.put_line('C');
    elsif v_score >= 60 then
        dbms_output.put_line('D');
    else 
        dbms_output.put_line('F');
    end if;
end;
/

--case
DECLARE
    v_score number := 87;
begin
    
    case trunc(v_score/10)
    when 10 then
        dbms_output.put_line('A');
    when 9 then
        dbms_output.put_line('B');
    when 8 then
        dbms_output.put_line('C');
    when 7 then
        dbms_output.put_line('D');
    else 
        dbms_output.put_line('F');
        end case;
end;
/
/* DEPT ���̺��� ������ ���� �ڷ��� ��� */
DECLARE
     V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
     SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
     FROM DEPT
     WHERE DEPTNO = 40;
     DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
     DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
     DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;
/

--loop
DECLARE
    v_num number :=0;
BEGIN
    loop
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : '||v_num);
        v_num := v_num+1;
        exit when v_num>4;
    end loop;
end;
/

DECLARE
    v_num number :=0;
BEGIN
    loop
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : '||v_num);
        v_num := v_num+1;
        if v_num >4 then
            exit;
    end if;
    end LOOP;
end;
/

DECLARE
    v_num number :=0;
BEGIN
    while v_num <4 loop
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : '||v_num);
        v_num := v_num+1;
    end LOOP;
end;
/

--for
DECLARE
    v_num number :=0;
BEGIN
    --�տ��� ���۰� �ڴ� �����°�
    for i in 0..4 loop
        DBMS_OUTPUT.PUT_LINE('���� i : '||i);
        v_num := v_num+1;
    end LOOP;
end;
/
-- for reverse
DECLARE
    v_num number :=0;
BEGIN
    --�տ��� ���۰� �ڴ� �����°�
    for i in reverse 0..4 loop
        DBMS_OUTPUT.PUT_LINE('���� i : '||i);
        v_num := v_num+1;
    end LOOP;
end;
/

--continue

DECLARE
    v_num number :=0;
BEGIN
    --�տ��� ���۰� �ڴ� �����°�
    for i in 0..4 loop
        continue when mod(i,2)=1;
        DBMS_OUTPUT.PUT_LINE('���� i : '||i);
        v_num := v_num+1;
    end LOOP;
end;
/

--[�ǽ�]1~10���� ����ϱ�
BEGIN
    --�տ��� ���۰� �ڴ� �����°�
    for i in 1..10 loop
        --continue when mod(i,2)=1;
        DBMS_OUTPUT.PUT_LINE('���� i : '||i);
    end LOOP;
end;
/
BEGIN
    --�տ��� ���۰� �ڴ� �����°�
    for i in 1..10 loop
        continue when mod(i,2)=0;
        DBMS_OUTPUT.PUT_LINE('���� i : '||i);
    end LOOP;
end;
/
BEGIN
    --�տ��� ���۰� �ڴ� �����°�
    for i in 1..10 loop
        if i mod 2 = 1 then
        DBMS_OUTPUT.PUT_LINE('���� i : '||i);
        end if;
    end LOOP;
end;
/

DECLARE
    v_dept detp%rowTYPE;
BEGIN
     if v_dept_row.deptno = 10 then
     DBMS_OUTPUT.PUT_LINE('dname : '||v_dept_row.dname);
     end if;
end;
/
DECLARE
    v_deptno dept.deptno%TYPE := 20;
BEGIN
     if v_deptno = 10 then
        DBMS_OUTPUT.PUT_LINE('dname : accounting');
     elsif v_deptno = 20 then
        DBMS_OUTPUT.PUT_LINE('dname : research');
     elsif v_deptno = 30 then
        DBMS_OUTPUT.PUT_LINE('dname : sales');
     elsif v_deptno = 40 then
         DBMS_OUTPUT.PUT_LINE('dname : operations');
     else
        DBMS_OUTPUT.PUT_LINE('dname : n/a');
     end if;
end;
/
DECLARE
    --dept ���̺��� ������ ���� �ڷ��� ���
    v_dept_row dept%rowtype;
BEGIN
    select deptno,dname,loc into v_dept_row
    from dept;
    
    DBMS_OUTPUT.PUT_LINE('DEPTno : '|| v_dept_row.deptno);
    DBMS_OUTPUT.PUT_LINE('Dname : '|| v_dept_row.dname);
    DBMS_OUTPUT.PUT_LINE('loc : '|| v_dept_row.loc);

end;
/

--���ڵ� : �ڷ����� ���� �ٸ� �����͸� �ϳ��� ������ ����
DECLARE
    type rec_dept is record(
    deptno number(2) not null := 99,
    dname dept.dname%type,
    loc dept.loc%type
    );
    dept_rec rec_dept;
BEGIN
    dept_rec.deptno :=99;
    dept_rec.dname := 'database';
    dept_rec.loc := 'seoul';
    DBMS_OUTPUT.PUT_LINE('deptno : ' ||dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('dname : '|| dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('loc : '|| dept_rec.loc);
end;
/

--���̺� ����(dept ���̺� ����)
create table dept_record
as select * from dept;

select *from dept_record;

-- ���ڵ带 ����� insert
DECLARE
    type rec_dept is record(
    deptno number(2) not null := 99,
    dname dept.dname%type,
    loc dept.loc%type
    );
    dept_rec rec_dept;
BEGIN
    dept_rec.deptno :=99;
    dept_rec.dname := 'database';
    dept_rec.loc := 'seoul';
    
    insert into dept_record
    values dept_rec;
end;
/
--���ڵ带 ����� update
DECLARE
    type rec_dept is record(
    deptno number(2) not null := 99,
    dname dept.dname%type,
    loc dept.loc%type
    );
    dept_rec rec_dept;
BEGIN
    dept_rec.deptno :=50;
    dept_rec.dname := 'JSP';
    dept_rec.loc := 'BUSAN';
    
    update  dept_record
    set row = dept_rec
    where deptno = 99;
end;
/

--���ڵ带 �����ϴ� ���ڵ�
DECLARE
    type rec_dept is record(
    deptno number(2) not null := 99,
    dname dept.dname%type,
    loc dept.loc%type
    );
    dept_rec rec_dept;
    type rec_emp is record(
        empno emp.empno%type,
        ename emp.ename%type,
        dinfo rec_dept);
        emp_rec rec_emp;
BEGIN
    select e.empno,e.ename,d.deptno,d.dname,d.loc
    into emp_rec.empno,emp_rec.ename,emp_rec.dinfo.deptno,emp_rec.dinfo.dname, emp_rec.dinfo.loc
    from emp e,dept d
    where e.deptno = d.deptno and e.empno = 7788;
    DBMS_OUTPUT.put_line('empno : '||emp_rec.empno);
    DBMS_OUTPUT.put_line('ename : '|| emp_rec.ename);
    
    DBMS_OUTPUT.put_line('deptno : '|| emp_rec.dinfo.deptno);
    DBMS_OUTPUT.put_line('dname : '|| emp_rec.dinfo.dname);
    DBMS_OUTPUT.put_line('loc : '|| emp_rec.dinfo.loc);
end;
/

--�÷��� : �ڷ����� ���� ���� ������ ����(�迭,list...)
--�����迭, ��ø���̺�, varray

-- �����迭 : key, value

declare
    type itab_ex is table of varchar2(20) index by pls_integer;
    
    text_arr itab_ex;
begin
    text_arr(1) := '1st data';
    text_arr(2) := '2st data';
    text_arr(3) := '3st data';
    text_arr(4) := '4st data';

    DBMS_OUTPUT.PUT_LINE('text_arr(1) : ' || text_arr(1));
    DBMS_OUTPUT.PUT_LINE('text_arr(2) : ' || text_arr(2));
    DBMS_OUTPUT.PUT_LINE('text_arr(3) : ' || text_arr(3));
    DBMS_OUTPUT.PUT_LINE('text_arr(4) : ' || text_arr(4));
end;
/

--���ڵ带 Ȱ���� �����迭
DECLARE
    --���ڵ� ����
    type rec_dept is record(
        deptno dept.deptno%type,
        dname dept.dname%type
    );
    --�����迭����
    --int arr[] = {}, Account arr[]
    type itab_dept is table of rec_dept index by pls_integer;
    
    dept_arr itab_dept;
    idx PLS_INTEGER := 0;
BEGIN
    for i in (select deptno, dname from dept) LOOP
        idx := idx +1;
        dept_arr(idx).deptno := i.deptno;
        dept_arr(idx).dname := i.dname;
    
    DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno ||' : '|| dept_arr(idx).dname);
    end loop;
end;
/

--�÷��� �޼��� ����ϱ�
declare
    type itab_ex is table of varchar2(20) index by pls_integer;
    
    text_arr itab_ex;
begin
    text_arr(1) := '1st data';
    text_arr(2) := '2st data';
    text_arr(3) := '3st data';
    text_arr(50) := '50st data';

    DBMS_OUTPUT.PUT_LINE('text_arr.count : ' || text_arr.count);
    DBMS_OUTPUT.PUT_LINE('text_arr.first : ' || text_arr.first);
    DBMS_OUTPUT.PUT_LINE('text_arr.last : ' || text_arr.last);
    DBMS_OUTPUT.PUT_LINE('text_arr.prior(50) : ' || text_arr.prior(50));
    DBMS_OUTPUT.PUT_LINE('text_arr.next(50) : ' || text_arr.next(50));

end;
/
create table emp_record
as select * fRom emp where 1<>1;
select * from emp_record;
DELETE from emp_record where empno = 6699;
DECLARE
    type rec_emp is record(
    empno emp.empno%type,
    ename emp.ename%type,
    job emp.job%type,
    mgr emp.mgr%type,
    hiredate emp.hiredate%type,
    sal emp.sal%type,
    comm emp.comm%type,
    deptno emp.deptno%type);
    emp_rec rec_emp;
BEGIN
    emp_rec.empno := 6699;
    emp_rec.ename := 'JOHN';
    emp_rec.job := 'SALEMAN';
    emp_rec.mgr := 7902;
    emp_rec.hiredate := '2007-11-05';
    emp_rec.sal := 1500;
    emp_rec.comm := null;
    emp_rec.deptno := 10;
    
    insert into emp_record
    values emp_rec;
end;
/

DECLARE
--    type rec_emp is record(
--    empno emp.empno%type,
--    ename emp.ename%type,
--    job emp.job%type,
--    mgr emp.mgr%type,
--    hiredate emp.hiredate%type,
--    sal emp.sal%type,
--    comm emp.comm%type,
--    deptno emp.deptno%type);

    type itab_emp is table of emp%rowtype index by pls_integer;
    
    emp_arr itab_emp;
    idx pls_integer := 0;
begin
    for i in (select * from emp) loop
    idx := idx +1;
    emp_arr(idx).empno := i.empno;
    emp_arr(idx).ename := i.ename;
    emp_arr(idx).job := i.job;
    emp_arr(idx).mgr := i.mgr;
    emp_arr(idx).hiredate := i.hiredate;
    emp_arr(idx).sal := i.sal;
    emp_arr(idx).comm := i.comm;
    emp_arr(idx).deptno := i.deptno;
    
    DBMS_OUTPUT.PUT_LINE(i.empno||' : '||i.ename||' : '||i.job||' : '||i.mgr||' : '||i.hiredate||' : '||i.sal||' : '||i.comm||' : '||i.deptno);
    end loop;
end;
/

--Ŀ�� : SQL �� ����� ����� ������ �޸� ����(private sql area)�� ������

--������ �����͸� �����ϴ� Ŀ��
DECLARE
    v_dept_row dept%rowtype;
    --����� Ŀ�� ����
    cursor c1 is
        select deptno,dname,loc
        from dept
        where deptno = 40;
BEGIN
    --Ŀ������
    open c1;
    
    --Ŀ���κ��� �о�� ������ ���(fetch)
    fetch c1 into v_dept_row;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| v_dept_row.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME : '|| v_dept_row.dname);
    DBMS_OUTPUT.PUT_LINE('LOC : '|| v_dept_row.loc);

    --Ŀ���ݱ�
    close c1;
    
end;
/
--(�����ุ ����)
DECLARE
    v_dept_row dept%rowtype;
BEGIN
    select deptno,dname,loc into v_dept_row
        from dept
        where deptno = 40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| v_dept_row.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME : '|| v_dept_row.dname);
    DBMS_OUTPUT.PUT_LINE('LOC : '|| v_dept_row.loc);
end;
/

--���� ���� ��ȸ�Ǵ� ��� cursor

DECLARE
    v_dept_row dept%rowtype;
    --����� Ŀ�� ����
    cursor c1 is
        select deptno,dname,loc
        from dept;
BEGIN
    --Ŀ������
    open c1;
        loop
        --Ŀ���κ��� �о�� ������ ���(fetch)
        fetch c1 into v_dept_row;
        
        --Ŀ���� ��� ���� �о���� ���� ����
        exit when c1%notfound;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| v_dept_row.deptno);
        DBMS_OUTPUT.PUT_LINE('DNAME : '|| v_dept_row.dname);
        DBMS_OUTPUT.PUT_LINE('LOC : '|| v_dept_row.loc);
    end loop;
    --Ŀ���ݱ�
    close c1;
    
end;
/

--for
DECLARE
    v_dept_row dept%rowtype;
    --����� Ŀ�� ����
    cursor c1 is
        select deptno,dname,loc
        from dept;
BEGIN
    --Ŀ�� for loop ����(�ڵ� open,fetch,close)
    for c1_rec in c1 loop    
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| c1_rec.deptno);
        DBMS_OUTPUT.PUT_LINE('DNAME : '|| c1_rec.dname);
        DBMS_OUTPUT.PUT_LINE('LOC : '|| c1_rec.loc);
    end loop;    
end;
/

--Ŀ���� �Ķ���� ���

DECLARE
    v_dept_row dept%rowtype;
    --����� Ŀ�� ����
    cursor c1(p_deptno dept.deptno%type) is
        select deptno,dname,loc
        from dept
        where deptno = p_deptno;
BEGIN
    --Ŀ������
    open c1(10);
        loop
            --Ŀ���κ��� �о�� ������ ���(fetch)
            fetch c1 into v_dept_row;
            --Ŀ���� ��� ���� �о���� ���� ����
            exit when c1%notfound;            
            
            DBMS_OUTPUT.PUT_LINE('10 ���μ� DEPTNO : '|| v_dept_row.deptno||'DNAME : '|| v_dept_row.dname||'LOC : '|| v_dept_row.loc);
        end loop;
    close c1;
    open c1(20);
        loop
            --Ŀ���κ��� �о�� ������ ���(fetch)
            fetch c1 into v_dept_row;
            --Ŀ���� ��� ���� �о���� ���� ����
            exit when c1%notfound;            
            
            DBMS_OUTPUT.PUT_LINE('20 ���μ� DEPTNO : '|| v_dept_row.deptno||'DNAME : '|| v_dept_row.dname||'LOC : '|| v_dept_row.loc);
        end loop;
    --Ŀ���ݱ�
    close c1;
    
end;
/

--for
DECLARE
    --����ڰ� �Է��� �μ���ȣ�� �����ϴ� ����
    v_deptno dept.deptno%type;
    --����� Ŀ�� ����
    cursor c1(p_deptno dept.deptno%type) is
        select deptno,dname,loc
        from dept
        where deptno = p_deptno;
BEGIN

    v_deptno := &input_deptno;
    --Ŀ�� for loop ����(�ڵ� open,fetch,close)
    for c1_rec in c1(v_deptno) loop    
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| c1_rec.deptno||' DNAME : '|| c1_rec.dname||' LOC : '|| c1_rec.loc);
    end loop;    
end;
/

--������ Ŀ��(dml ��ɾ select into ����ɶ� �ڵ����� ���� �� ó��)
BEGIN
    update dept_record set dname = 'DATABASE'
    where deptno = 50;
    
    DBMS_OUTPUT.put_line('���ŵ� ���� �� : '||sql%rowcount);
    
    if(sql%found) then
    DBMS_OUTPUT.put_line('���� ��� �� ���� ���� : true');
    else
    DBMS_OUTPUT.put_line('���� ��� �� ���� ���� : false');
    end if;
    if(sql%isopen) then
    DBMS_OUTPUT.put_line('Ŀ���� open ���� ���� : true');
    else
    DBMS_OUTPUT.put_line('Ŀ���� open ���� ���� : false');
    end if;
end;
/
commit;

--����(����)
--������ ���� / ��Ÿ�� ����

DECLARE
    v_wrong number;
BEGIN
    select dname into v_wrong
    from dept
    where deptno=10;
EXCEPTION
    when value_error then
    DBMS_OUTPUT.PUT_LINE('����ó�� - ��ġ �Ǵ� �� ���� �߻�');
end;
/

--���� ����(interral exception(���ο���)/user-defind exception(��������� ����))

DECLARE
    v_wrong number;
BEGIN
    select dname into v_wrong
    from dept
    where deptno=10;
EXCEPTION
    when too_manuyrow then
        DBMS_OUTPUT.PUT_LINE('����ó�� - �䱸���� ���� �� ���� ����');
    when value_error then
        DBMS_OUTPUT.PUT_LINE('����ó�� - ��ġ �Ǵ� �� ���� �߻�');
    when others then
        DBMS_OUTPUT.PUT_LINE('����ó�� - ���� ���� �� ���� �߻�');
end;
/

DECLARE
    v_wrong number;
BEGIN
    select dname into v_wrong
    from dept
    where deptno=10;
EXCEPTION
    when others then
 
        DBMS_OUTPUT.PUT_LINE('����ó�� - ���� ���� �� ���� �߻�');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : '|| to_char(sqlcode)); --sqlcode ������ȣ
        DBMS_OUTPUT.PUT_LINE('SQLERRM : '|| sqlerrm); --sqlerrm�����޼���



end;
/

DECLARE
    v_dept_row dept%rowtype;
    --����� Ŀ�� ����
    cursor c1 is
        select deptno,dname,loc
        from dept;
BEGIN
    --Ŀ�� for loop ����(�ڵ� open,fetch,close)
    for c1_rec in c1 loop    
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| c1_rec.deptno);
        DBMS_OUTPUT.PUT_LINE('DNAME : '|| c1_rec.dname);
        DBMS_OUTPUT.PUT_LINE('LOC : '|| c1_rec.loc);
    end loop;    
end;
/

DECLARE
    v_emp_row emp%rowtype;
    cursor cl is
    select *
    from emp;
BEGIN
    open cl;
    loop
        fetch cl into v_emp_row;
        exit when cl%notfound;
        DBMS_OUTPUT.PUT_LINE(v_emp_row.empno||' '||v_emp_row.ename||' '||
        v_emp_row.job ||' '||v_emp_row.mgr||' '||v_emp_row.hiredate||' '||
        v_emp_row.sal||' '||v_emp_row.comm||' '||v_emp_row.deptno);
        end loop;
end;
/

select * from emp;

DECLARE
    cursor cl is
    select *
    from emp;
BEGIN   
    for v_emp_row in cl loop
        DBMS_OUTPUT.PUT_LINE(v_emp_row.empno||' '||v_emp_row.ename||' '||
        v_emp_row.job ||' '||v_emp_row.mgr||' '||v_emp_row.hiredate||' '||
        v_emp_row.sal||' '||v_emp_row.comm||' '||v_emp_row.deptno);
        end loop;
end;
/

--���� ���� ���α׷� : �̸� ����, ���尡��, ������ �� �� �� ������, ��������, ȣ�Ⱑ��

--�͸��� : �̸�����, ������ �� ����, ������ �� ���� ������, ���� �ȵ�, �ٸ� �������α׷����� ȣ�� �ȵ�

--���ν��� ����
create or replace PROCEDURE pro_noparam
is
    v_empno number(4) := 7788;
    v_ename varchar2(10);
BEGIN
    v_ename := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : '||v_empno);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : '||v_ename);
end;
/

execute pro_noparam;

--pl/sql ��Ͽ��� ���ν��� ����
begin
    pro_noparam;
end;
/
--���ν��� �����ϱ�
drop PROCEDURE pro_noparam;

--���ν����� �Ķ���� ���� : in,out,inout

--in �Ķ����(�⺻)
create or replace PROCEDURE pro_param_in
(
    param1 in number,
    param2 number,
    param3 number := 3,
    param4 number default 2
)
is
 BEGIN
    DBMS_OUTPUT.PUT_LINE('param1 : '||param1);
    DBMS_OUTPUT.PUT_LINE('param2 : '||param2);
    DBMS_OUTPUT.PUT_LINE('param3 : '||param3);
    DBMS_OUTPUT.PUT_LINE('param4 : '||param4);
end;
/

EXECUTE pro_param_in(1,2,7,8);

EXECUTE pro_param_in(1,2);

--out ��� �Ķ����(���ν��� ���� �� ȣ���� ���α׷����� �� ��ȯ)
create or replace procedure pro_param_out
(
    in_empno in emp.empno%type,
    out_ename out emp.ename%type,
    out_sal out emp.sal%type
)
is
begin
    select ename, sal into out_ename,out_sal
    from emp
    where empno = in_empno;
end;
/

--�ٸ� pl/sql��Ͽ��� ���ν��� ���
DECLARE
    v_ename emp.ename%type;
    v_sal emp.sal%type;
begin
    pro_param_out(7788,v_ename,v_sal);
    DBMS_OUTPUT.PUT_LINE('ENAME : '|| v_ename);
    DBMS_OUTPUT.PUT_LINE('SAL : '|| v_sal);

end;
/

--in out : in,out ����� ���ÿ� ����
create or replace PROCEDURE pro_param_inout
(
    inout_no in out number
)
is
begin
    inout_no := inout_no * 2;
end;
/

declare
    no number;
begin
    no := 5;
    pro_param_inout(no);
    DBMS_OUTPUT.PUT_LINE('no : '||no);
end;
/

--javadb���� ����
create or REPLACE PROCEDURE register_user
(
    name nvarchar2,
    year number,
    addr nchar,
    mobile nvarchar2
)
is
begin
    insert into userTBL(no,username, birthyear,addr,mobile)
    values(usertbl_seq.nextval,name,year,addr,mobile);
    commit;
    DBMS_OUTPUT.PUT_LINE(name||year||addr||mobile);
end;
/

EXECUTE register_user('������','1996','�λ�','010-4569-4568');

select * from usertbl;
--//
create or replace procedure pro_dept
(
    inout_deptno in out dept.deptno%type,
    out_dname out dept.dname%type,
    out_loc out dept.loc%type
)
is
begin
    SELECT deptno,dname,loc into inout_deptno,out_dname,out_loc 
    FROM dept
    where deptno = inout_deptno;
end;
/
drop PROCEDURE pro_dept;
DECLARE
    v_deptno dept.deptno%type;
    v_dname dept.dname%type;
    v_loc dept.loc%type;

begin
    v_deptno :=10;
    pro_dept(v_deptno,v_dname,v_loc);
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ : '|| v_deptno);
    DBMS_OUTPUT.PUT_LINE('�μ��� : '|| v_dname);
    DBMS_OUTPUT.PUT_LINE('���� : '|| v_loc);

end;
/
select * from dept;

--Ʈ���� : �����ͺ��̽� ���� Ư�� ��Ȳ�̳� ����, �� �̺�Ʈ�� �߻��� �� �ڵ����� �����Ű�� ���

--before Ʈ����
--Ʈ���Ÿ� ������ ���̺� ����
create table emp_trg as select * from emp;

-- emp_trg�� dml����(�ָ��̶�� ������� ���� �Ұ�) ���� Ʈ���� �߻�
--raise_application_error : ����� ���� ����
--���������ڵ�� -20000~-20999 ������ ���ڸ� ���
create or replace trigger trg_emp_nodml_weekend
before
--Ʈ���� ����
insert or update or delete on emp_trg
begin
    if to_char(sysdate,'DY')in('��','��') then
        if inserting then        
            raise_application_error(-20000,'�ָ� ������� �߰� �Ұ�');
        elsif updating then
            raise_application_error(-20001,'�ָ� ������� �߰� �Ұ�');
        elsif deleting then
            raise_application_error(-20002,'�ָ� ������� �߰� �Ұ�');
        else
            raise_application_error(-20003,'�ָ� ������� �߰� �Ұ�');
        end if;
    end if;
end;
/

select * from emp_trg;

update emp_trg
set sal = 3000
where empno = 7788;

--Ʈ���� : after
--emp_trg ���̺� dml ��ɾ ����� ��� ���̺� ����� dml ��ɾ���
--����,dml �� �����Ų �����, dml ��ɾ ����� ��¥�� �ð� ����
create table emp_trg_log(
    tavlename VARCHAR2(10),
    dml_type VARCHAR2(10),
    empno number(4),
    user_name VARCHAR2(30),
    change_date date);

create or replace trigger trg_emp_log
after
insert or delete or update on emp_trg
for each row --dml ���ڿ� ���� ����޴� �ະ�� ����

begin
    if inserting then
        insert into emp_trg_log
        values('EMP_TRG','INSERT', :new.empno,
        sys_context('USERENV','SESSION_USER'),sysdate);-- ���� �����ͺ��̽� ������
    elsif updating then
        insert into emp_trg_log
        values('EMP_TRG','UPDATE', :old.empno,
        sys_context('USERENV','SESSION_USER'),sysdate);
    elsif deleting then
        insert into emp_trg_log
        values('EMP_TRG','DELETE', :old.empno,
        sys_context('USERENV','SESSION_USER'),sysdate);
    end if;
end;
/

insert into emp_trg values(9990,'TESTemp','CLERK',7788, to_date('2018-03-03','YYYY-MM-DD'),1200,null,20);

select * from emp_trg;

select * from emp_trg_log;

update emp_trg 
set sal=1300
where mgr=7788;

--Ʈ���� ��ȸ
select *
from user_triggers;

--Ʈ���� ����
drop trigger trg_emp_log;

--Ʈ���� ����(Ȱ��ȭ Ȥ�� ��Ȱ��ȭ) enable of disavle
alter trigger trg_emp_nodml_weekend disable;


commit;
