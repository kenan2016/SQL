-- if 语句 的3中形式
/*
if then
  
end if;

if then
elsif
end if;

if then 
elsif then
elsif  then
else 
end if;
*/


-- 举例 -- 使用 if 语句判断用户从键盘上输入的数字
-- 如何在plsql中接收键盘输入（注意，Oracle中、我们从键盘上输入的 内容都是字符串）

-- 打开 控制台输出 
set serverout on
-- 使用 accept 指令 打开 键盘输入   prompt 来进行提示
-- 注意，num  是一个地址值 这句话含义 是：，该地址上存放了输入的值
accept num prompt '请输入一个数字:';

declare 
-- 定义变来存放地址上的值（我们这里在申明变量时，直接改变量赋值）
pnum number := &num;
begin
  -- dml语句
  -- 流程控制语句
  -- oracle ;里判断语句是 =   ，赋值语句 是  := 
  -- 再次说一下，输入的值是一个字符串，只是 我们这里Oracle 做了自行的转换！！
  if pnum=1 then
    dbms_output.put_line('您输入的是1');
  elsif pnum=2 then
    dbms_output.put_line('您输入的是2');
  elsif pnum=3 then
    dbms_output.put_line('您输入的是3');
  else
    dbms_output.put_line('您输入的是其他数字');
  end if;
end;
/


