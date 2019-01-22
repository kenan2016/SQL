-- 在PLSQL中要注意事务的一致性
declare 
-- 申明游标 、根据员工的职位给员工涨工资总裁 以1000 经理800 其他人400
-- 分析需要参数：员工编号、员工职位
cursor cemp is select emp.ename, emp.empno from emp ;
--同时申明变量
pname emp.ename%type;
pno emp.empno%type;

begin
  loop
    
  end loop;
end