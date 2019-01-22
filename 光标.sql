-- 光标
declare  
-- 打开光标
cursor cemp is select ename,sal from scott.emp ;
-- 同时申明变量
pname emp.ename%type;
psal emp.sal%type;

begin
-- 打开光标
open cemp;
  --遍历集合 
  loop
  -- 提取一条记录 注意变量摆放的顺序
  fetch cemp into pname, psal;
  exit when cemp%notfound;
  dbms_output.put_line(pname||'的薪水是：'||psal);
  end loop;
close cemp;
end;