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


























































