-- plsql �쳣
set serveroutput on;
declare
pname emp.ename%type;
pno NUMBER;

begin
-- ��0�쳣 zero_divide
-- ֵת���쳣
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
    when value_error then dbms_output.put_line('value_error(������ת������)');
    -- others ����ŵ�ǰ��
  when others then dbms_output.put_line('others');

end;
/