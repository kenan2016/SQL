-- ��¼�ͱ���

-- ע������Ĳ�ѯ�������������ֶλ� * ����ᱨ��
set serveroutput on;
declare 
emp_rec emp%rowtype;
begin
  select EMPNO,                          
ENAME,                          
JOB,                            
MGR,                            
HIREDATE,                       
SAL,                           
COMM,                           
DEPTNO  into emp_rec from emp  WHERE empno =7839  ;
  dbms_output.put_line(emp_rec.sal);
end;
/

--//test_table �Ǳ�������ѯʱ��������ȫ����д
-- ��ѯ�������ֶ�
-- select tt.column_name from user_col_comments tt where tt.table_name=upper('emp');
 
 
 
 -- select tt.column_name from user_col_comments tt where tt.table_name = upper('emp')
