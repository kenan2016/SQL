-- ��¼�ͱ���  -����һ���м�¼v
set serveroutput on;
declare 
-- ������¼�ͱ���
emp_rec emp%rowtype;
-- �����ͱ���
empname emp.ename%type;
sal emp.sal% TYPe;
begin
  select * INTO emp_rec from emp where empno='7521';
  dbms_output.put_line('name:'||emp_rec.ename||'     salary:'||emp_rec.sal);
end;
/