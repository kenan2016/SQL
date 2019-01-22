-- 在块中打印 hello world
-- 要先打开控制台输出显示（Oracle 默认是关闭的）
set serveroutput on;
declare 
-- 申明部分 
 
 -- 逻辑语句编写的位置
begin
  dbms_output.put_line('helloworld!');
end;
