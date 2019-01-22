/*
调用存储过程、方法1：
execute   可以缩写为exec
如 exec sayhell();

2、在另外一个存储过程中调用这个存储过程
如：
begin 
sayhell();
sayhello();
end;/
*/




/*创建存储过程*/
create or REPLACE procedure sayHello
as
-- 说明部分
begin
dbms_output.put_line('hello world');
end;
/

begin
 sayhello();
 sayhello();
end


select * from e