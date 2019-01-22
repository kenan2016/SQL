-- plsql 自定义异常
-- 基本已发 先定义异常 、使用 raise 关键字捕获异常、 在 exception中捕获异常
set serveroutput on;
declare
-- 定义游标
cursor cemp is select ename from emp where deptno=555;
-- 定义变量
pname emp.ename%type;
-- 自定义异常
ex_no_data exception;

begin
  -- 打开游标
  open cemp;
  -- 循环
  loop
    fetch cemp into pname;
    if cemp%notfound then 
    -- 抛出异常
      raise ex_no_data;
    end if;
  end loop;
  -- 注意 当异常发生后 Oracle 会自动启动一个叫pmon （process mirror 进程监视器）的进程，自动释放未关闭的资源 
  close cemp;
  
  -- 处理异常
  exception 
  when ex_no_data then dbms_output.put_line('异常处理——no-datas');
  when others then dbms_output.put_line('others');
end;
/
