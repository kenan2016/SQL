-- 记录型变量  -代表一个行记录v
set serveroutput on;
declare 
-- 申明记录型变量
emp_rec emp%rowtype;
-- 引用型变量
empname emp.ename%type;
sal emp.sal% TYPe;
begin
  select * INTO emp_rec from emp where empno='7521';
  dbms_output.put_line('name:'||emp_rec.ename||'     salary:'||emp_rec.sal);
end;
/