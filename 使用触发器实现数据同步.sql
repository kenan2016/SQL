--快速创建备份表
-- create table emp_back as select * from emp;

--案例：当emp表中员工工资改变时、同步更新到备份表中
--create table emp_back as select * from emp;
--drop table emp_back
create or replace trigger sync_emp_sal
after update on emp
for each row
Begin
  -- 当主表更新以后自动将新的值赋给备份表，以达到数据备份的目的
  UPDATE emp_back set emp_back.sal = :new.sal where empno=:new.empno; -- 注意这个更新语句一定要加条件
end;
/

create table emp_back as select * from emp;