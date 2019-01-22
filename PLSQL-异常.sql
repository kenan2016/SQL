-- plsql 异常
set serveroutput on;
declare
pname emp.ename%type;
pno NUMBER;

begin
-- 除0异常 zero_divide
-- 值转换异常
pno := 'abc';
--pno:= 1/0;
-- no_data_found
 -- select ename into pname from  emp where empno = 123456;
  SELECT ename into pname FROM emp where job = 'SALESMAN';
  exception
  when no_data_found then dbms_output.put_line('no_data_found');
  when too_many_rows THEN dbms_output.put_line('too_many_rows');
  WHEN zero_divide then 
  dbms_output.put_line('zero_divide1');
  dbms_output.put_line('zero_divide1');
    when value_error then dbms_output.put_line('value_error(算数或转换错误)');
    -- others 必须放到前面
  when others then dbms_output.put_line('others');

end;
/