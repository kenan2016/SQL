set serveroutput on;
-- 光标的属性
--notfound、 found
--%isopen 判断光标是否打开
-- rowcount 直译叫行数、但是在Oracle 中是 影响的行数  比如 游标当中有100条记录 而我已经取走了 10条记录，那么则表示是10   即当前第几条记录
declare
-- 申明光标
  cursor cemp is select ename,sal from emp;
  -- 申明变量
  cname emp.ename%type;
  csal emp.sal%type;
begin
  --打开光标
  open cemp;
  if cemp%isopen then
    dbms_output.put_line('光标已打开！');
  else 
    dbms_output.put_line('光标已打开！');
  end if;
  LOOP
  FETch cemp into cname, csal;
  EXIT WHEN cemp%notfound;
  dbms_output.put_line('当前rowcount is'||cemp%rowcount);
  end loop;
  
  -- 关闭光标 (注意啊一定要关闭光标 ， Oracle 中 当光标数打开到一定程度以后就不能再打开了
  --默认情况下、Oracle数据库只允许在同一个会话中打开300个光标、可使用 Oracle 的命令查看 -- 需要在管理员用户下 查看)
  close cemp;
end;
/