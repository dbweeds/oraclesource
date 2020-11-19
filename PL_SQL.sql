--실행 결과를 화면에 출력
set SERVEROUTPUT on;

begin
    dbms_output.put_line('Hello PL/SQL');
end;
/

--변수
DECLARE 
    --변수선언: 변수명 타입 ;
    --         변수명 타입 := 값;
    v_empno number(4):= 7788;
    v_ename varchar2(10);
begin
    v_ename := 'SCOTT';
    dbms_output.put_line('v_empno : '|| v_empno);
    dbms_output.put_line('v_ename : '|| v_ename);
end;
/

--상수
DECLARE
    v_tax constant number(1) := 3;
BEGIN
    dbms_output.put_line('V_TAX : '||v_tax);
end;
/

--변수의 기본값 지정
DECLARE
    v_deptno number(2) DEFAULT 10;
BEGIN
    dbms_output.put_line('V_DEPTNO : '|| v_deptno);
end;
/

--변수에 null 값 저장 막기
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

--자료형
--스칼라형 : 오라클 데이터베이스에서 사용하는 자료형 + Boolean
--참조형 : 다른 테이블의 컬럼 자료형이나, 하나의 행 구조를 참조

--특정 테이블의 컬럼 자료형 참조
DECLARE
    --dept 테이블의 deptno와 같은 자료형 사용
    v_deptno dept.deptno%type := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '||v_deptno);
end;
/

DECLARE
    --dept 테이블의 구조와 같은 자료형 사용
    v_dept_row dept%rowtype;
BEGIN
    select deptno,dname,loc into v_dept_row
    from dept;
    if v_dept_row.deptno =10 then
    DBMS_OUTPUT.PUT_LINE('Dname : '|| v_dept_row.dname);
   end if;

end;
/


--조건문

--if
DECLARE
    v_number number := 13;
BEGIN
    if mod(v_number,2) = 1 then
        dbms_output.put_line('V_NUMBER 홀수');
    end if;
end;
/

--if ~else
DECLARE
    v_number number := 984273984792837498272;
BEGIN
    if mod(v_number,2) = 1 then
        dbms_output.put_line('V_NUMBER 홀수');
    ELSE
        dbms_output.put_line('V_NUMBER 짝수');
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
/* DEPT 테이블의 구조와 같은 자료형 사용 */
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
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : '||v_num);
        v_num := v_num+1;
        exit when v_num>4;
    end loop;
end;
/

DECLARE
    v_num number :=0;
BEGIN
    loop
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : '||v_num);
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
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM : '||v_num);
        v_num := v_num+1;
    end LOOP;
end;
/

--for
DECLARE
    v_num number :=0;
BEGIN
    --앞에는 시작값 뒤는 끝나는값
    for i in 0..4 loop
        DBMS_OUTPUT.PUT_LINE('현재 i : '||i);
        v_num := v_num+1;
    end LOOP;
end;
/
-- for reverse
DECLARE
    v_num number :=0;
BEGIN
    --앞에는 시작값 뒤는 끝나는값
    for i in reverse 0..4 loop
        DBMS_OUTPUT.PUT_LINE('현재 i : '||i);
        v_num := v_num+1;
    end LOOP;
end;
/

--continue

DECLARE
    v_num number :=0;
BEGIN
    --앞에는 시작값 뒤는 끝나는값
    for i in 0..4 loop
        continue when mod(i,2)=1;
        DBMS_OUTPUT.PUT_LINE('현재 i : '||i);
        v_num := v_num+1;
    end LOOP;
end;
/

--[실습]1~10까지 출력하기
BEGIN
    --앞에는 시작값 뒤는 끝나는값
    for i in 1..10 loop
        --continue when mod(i,2)=1;
        DBMS_OUTPUT.PUT_LINE('현재 i : '||i);
    end LOOP;
end;
/
BEGIN
    --앞에는 시작값 뒤는 끝나는값
    for i in 1..10 loop
        continue when mod(i,2)=0;
        DBMS_OUTPUT.PUT_LINE('현재 i : '||i);
    end LOOP;
end;
/
BEGIN
    --앞에는 시작값 뒤는 끝나는값
    for i in 1..10 loop
        if i mod 2 = 1 then
        DBMS_OUTPUT.PUT_LINE('현재 i : '||i);
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
    --dept 테이블의 구조와 같은 자료형 사용
    v_dept_row dept%rowtype;
BEGIN
    select deptno,dname,loc into v_dept_row
    from dept;
    
    DBMS_OUTPUT.PUT_LINE('DEPTno : '|| v_dept_row.deptno);
    DBMS_OUTPUT.PUT_LINE('Dname : '|| v_dept_row.dname);
    DBMS_OUTPUT.PUT_LINE('loc : '|| v_dept_row.loc);

end;
/

--레코드 : 자료형이 각기 다른 데이터를 하나의 변수에 저장
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

--테이블 생성(dept 테이블 복사)
create table dept_record
as select * from dept;

select *from dept_record;

-- 레코드를 사용한 insert
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
--레코드를 사용한 update
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

--레코드를 포함하는 레코드
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

--컬랙션 : 자료형이 같은 여러 데이터 저장(배열,list...)
--연관배열, 중첩테이블, varray

-- 연관배열 : key, value

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

--레코드를 활용한 연관배열
DECLARE
    --레코드 정의
    type rec_dept is record(
        deptno dept.deptno%type,
        dname dept.dname%type
    );
    --연관배열정의
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

--컬렉션 메서드 사용하기
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

--커서 : SQL 문 실행시 결과를 저장한 메모리 공간(private sql area)의 포인터

--단일행 데이터를 저장하는 커서
DECLARE
    v_dept_row dept%rowtype;
    --명시적 커서 선언
    cursor c1 is
        select deptno,dname,loc
        from dept
        where deptno = 40;
BEGIN
    --커서열기
    open c1;
    
    --커서로부터 읽어온 데이터 사용(fetch)
    fetch c1 into v_dept_row;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| v_dept_row.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME : '|| v_dept_row.dname);
    DBMS_OUTPUT.PUT_LINE('LOC : '|| v_dept_row.loc);

    --커서닫기
    close c1;
    
end;
/
--(단일행만 가능)
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

--여러 행이 조회되는 경우 cursor

DECLARE
    v_dept_row dept%rowtype;
    --명시적 커서 선언
    cursor c1 is
        select deptno,dname,loc
        from dept;
BEGIN
    --커서열기
    open c1;
        loop
        --커서로부터 읽어온 데이터 사용(fetch)
        fetch c1 into v_dept_row;
        
        --커서의 모든 행을 읽어오기 위해 지정
        exit when c1%notfound;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| v_dept_row.deptno);
        DBMS_OUTPUT.PUT_LINE('DNAME : '|| v_dept_row.dname);
        DBMS_OUTPUT.PUT_LINE('LOC : '|| v_dept_row.loc);
    end loop;
    --커서닫기
    close c1;
    
end;
/

--for
DECLARE
    v_dept_row dept%rowtype;
    --명시적 커서 선언
    cursor c1 is
        select deptno,dname,loc
        from dept;
BEGIN
    --커서 for loop 시작(자동 open,fetch,close)
    for c1_rec in c1 loop    
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| c1_rec.deptno);
        DBMS_OUTPUT.PUT_LINE('DNAME : '|| c1_rec.dname);
        DBMS_OUTPUT.PUT_LINE('LOC : '|| c1_rec.loc);
    end loop;    
end;
/

--커서에 파라미터 사용

DECLARE
    v_dept_row dept%rowtype;
    --명시적 커서 선언
    cursor c1(p_deptno dept.deptno%type) is
        select deptno,dname,loc
        from dept
        where deptno = p_deptno;
BEGIN
    --커서열기
    open c1(10);
        loop
            --커서로부터 읽어온 데이터 사용(fetch)
            fetch c1 into v_dept_row;
            --커서의 모든 행을 읽어오기 위해 지정
            exit when c1%notfound;            
            
            DBMS_OUTPUT.PUT_LINE('10 번부서 DEPTNO : '|| v_dept_row.deptno||'DNAME : '|| v_dept_row.dname||'LOC : '|| v_dept_row.loc);
        end loop;
    close c1;
    open c1(20);
        loop
            --커서로부터 읽어온 데이터 사용(fetch)
            fetch c1 into v_dept_row;
            --커서의 모든 행을 읽어오기 위해 지정
            exit when c1%notfound;            
            
            DBMS_OUTPUT.PUT_LINE('20 번부서 DEPTNO : '|| v_dept_row.deptno||'DNAME : '|| v_dept_row.dname||'LOC : '|| v_dept_row.loc);
        end loop;
    --커서닫기
    close c1;
    
end;
/

--for
DECLARE
    --사용자가 입력한 부서번호를 저장하는 변수
    v_deptno dept.deptno%type;
    --명시적 커서 선언
    cursor c1(p_deptno dept.deptno%type) is
        select deptno,dname,loc
        from dept
        where deptno = p_deptno;
BEGIN

    v_deptno := &input_deptno;
    --커서 for loop 시작(자동 open,fetch,close)
    for c1_rec in c1(v_deptno) loop    
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| c1_rec.deptno||' DNAME : '|| c1_rec.dname||' LOC : '|| c1_rec.loc);
    end loop;    
end;
/

--묵시적 커서(dml 명령어나 select into 실행될때 자동으로 생성 및 처리)
BEGIN
    update dept_record set dname = 'DATABASE'
    where deptno = 50;
    
    DBMS_OUTPUT.put_line('갱신된 행의 수 : '||sql%rowcount);
    
    if(sql%found) then
    DBMS_OUTPUT.put_line('갱신 대상 행 존재 여부 : true');
    else
    DBMS_OUTPUT.put_line('갱신 대상 행 존재 여부 : false');
    end if;
    if(sql%isopen) then
    DBMS_OUTPUT.put_line('커서의 open 존재 여부 : true');
    else
    DBMS_OUTPUT.put_line('커서의 open 존재 여부 : false');
    end if;
end;
/
commit;

--예외(오류)
--컴파일 오류 / 런타임 오류

DECLARE
    v_wrong number;
BEGIN
    select dname into v_wrong
    from dept
    where deptno=10;
EXCEPTION
    when value_error then
    DBMS_OUTPUT.PUT_LINE('예외처리 - 수치 또는 값 오류 발생');
end;
/

--예외 종료(interral exception(내부예외)/user-defind exception(사용자정의 예외))

DECLARE
    v_wrong number;
BEGIN
    select dname into v_wrong
    from dept
    where deptno=10;
EXCEPTION
    when too_manuyrow then
        DBMS_OUTPUT.PUT_LINE('예외처리 - 요구보다 많은 행 추출 오류');
    when value_error then
        DBMS_OUTPUT.PUT_LINE('예외처리 - 수치 또는 값 오류 발생');
    when others then
        DBMS_OUTPUT.PUT_LINE('예외처리 - 사전 정의 외 오류 발생');
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
 
        DBMS_OUTPUT.PUT_LINE('예외처리 - 사전 정의 외 오류 발생');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : '|| to_char(sqlcode)); --sqlcode 오류번호
        DBMS_OUTPUT.PUT_LINE('SQLERRM : '|| sqlerrm); --sqlerrm오류메세지



end;
/

DECLARE
    v_dept_row dept%rowtype;
    --명시적 커서 선언
    cursor c1 is
        select deptno,dname,loc
        from dept;
BEGIN
    --커서 for loop 시작(자동 open,fetch,close)
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

--저장 서브 프로그램 : 이름 지정, 저장가능, 저장할 때 한 번 컴파일, 공유가능, 호출가능

--익명블록 : 이름없음, 저장할 수 없음, 실행할 때 마다 컴파일, 공유 안됨, 다른 응용프로그램에서 호출 안됨

--프로시저 생성
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

--pl/sql 블록에서 프로시저 실행
begin
    pro_noparam;
end;
/
--프로시저 삭제하기
drop PROCEDURE pro_noparam;

--프로시저에 파라미터 지정 : in,out,inout

--in 파라미터(기본)
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

--out 모드 파라미터(프로시저 실행 후 호출한 프로그램으로 값 반환)
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

--다른 pl/sql블록에서 프로시저 사용
DECLARE
    v_ename emp.ename%type;
    v_sal emp.sal%type;
begin
    pro_param_out(7788,v_ename,v_sal);
    DBMS_OUTPUT.PUT_LINE('ENAME : '|| v_ename);
    DBMS_OUTPUT.PUT_LINE('SAL : '|| v_sal);

end;
/

--in out : in,out 기능을 동시에 수행
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

--javadb에서 실행
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

EXECUTE register_user('대조영','1996','부산','010-4569-4568');

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
    DBMS_OUTPUT.PUT_LINE('부서번호 : '|| v_deptno);
    DBMS_OUTPUT.PUT_LINE('부서명 : '|| v_dname);
    DBMS_OUTPUT.PUT_LINE('지역 : '|| v_loc);

end;
/
select * from dept;

--트리거 : 데이터베이스 안의 특정 상황이나 동작, 즉 이벤트가 발생할 때 자동으로 실행시키는 기능

--before 트리거
--트리거를 적용할 테이블 생성
create table emp_trg as select * from emp;

-- emp_trg에 dml구문(주말이라면 사원정보 수정 불가) 사용시 트리거 발생
--raise_application_error : 사용자 정의 예외
--예외지정코드는 -20000~-20999 범위의 숫자를 사용
create or replace trigger trg_emp_nodml_weekend
before
--트리거 연결
insert or update or delete on emp_trg
begin
    if to_char(sysdate,'DY')in('토','일') then
        if inserting then        
            raise_application_error(-20000,'주말 사원정보 추가 불가');
        elsif updating then
            raise_application_error(-20001,'주말 사원정보 추가 불가');
        elsif deleting then
            raise_application_error(-20002,'주말 사원정보 추가 불가');
        else
            raise_application_error(-20003,'주말 사원정보 추가 불가');
        end if;
    end if;
end;
/

select * from emp_trg;

update emp_trg
set sal = 3000
where empno = 7788;

--트리거 : after
--emp_trg 테이블에 dml 명령어가 실행될 결우 테이블에 수행된 dml 명령어의
--종류,dml 을 실행시킨 사용자, dml 명령어가 수행된 날짜와 시간 저장
create table emp_trg_log(
    tavlename VARCHAR2(10),
    dml_type VARCHAR2(10),
    empno number(4),
    user_name VARCHAR2(30),
    change_date date);

create or replace trigger trg_emp_log
after
insert or delete or update on emp_trg
for each row --dml 문자에 의해 영향받는 행별로 실행

begin
    if inserting then
        insert into emp_trg_log
        values('EMP_TRG','INSERT', :new.empno,
        sys_context('USERENV','SESSION_USER'),sysdate);-- 현재 데이터베이스 접속자
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

--트리거 조회
select *
from user_triggers;

--트리거 삭제
drop trigger trg_emp_log;

--트리거 변경(활성화 혹은 비활성화) enable of disavle
alter trigger trg_emp_nodml_weekend disable;


commit;
