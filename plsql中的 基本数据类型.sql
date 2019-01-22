set serveroutput on;
declare 
-- 基本数据类型
  v_age number(6,2);
  v_date date;
  v_name varchar2(20);
begin
  v_age := 10;
  dbms_output.put_line(v_age);
  v_date :=sysdate;
  v_name:='kenan';
end;
/
