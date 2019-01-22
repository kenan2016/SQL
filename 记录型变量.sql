-- 记录型变量

-- 注意下面的查询语句必须是所有字段或 * 否则会报错
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

--//test_table 是表名，查询时表名必须全部大写
-- 查询表所有字段
-- select tt.column_name from user_col_comments tt where tt.table_name=upper('emp');
 
 
 
 -- select tt.column_name from user_col_comments tt where tt.table_name = upper('emp')
