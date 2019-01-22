-- out 参数   查询某个员工的姓名，月薪和职位   out参数作用；在这个 存储过程或存储函数被调用者调用完成 以后OUT 可以返回给调用者
create or replace PROCEDURE query_emp_info (eno in number,
                                  pename out VARCHAR2,
                                  psal out NUMBER,
                                  pjob out VARCHAR2
                                )
as 
-- 因为这里我们直接使用输出参数作为变量所以不用再定义变量接收

begin
  select emp.ename,emp.sal,emp.job into pname,psal,pjob from emp where emp.empno = eno;
end;
-- 输出参数会直接返回给客户端（调用者）。
/