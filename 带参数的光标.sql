-- 定义带参数的光标
-- 查询摸个部门的所有员工姓名
set serveroutput on;
declare
-- 定义光标
cursor cemp(dno NUMBER) is select ename from emp where emp.deptno = dno;
-- 定义变量
cname emp.ename%type;
begin
  -- 打开光标\并赋值？
  open cemp(10);
  loop
    -- 获取一条记录
    fetch cemp into cname;
    exit when cemp%notfound;
    dbms_output.put_line('name is:' ||cname);   
  end loop;
  -- 关闭光标哦
  close cemp;
end;
/