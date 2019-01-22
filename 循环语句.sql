-- while loop 循环
--  loop when（或exit）  循环
-- for 循环
set serveroutput on;
-- 示例1:   while loop 循环打印 1打印100
declare
v_num number :=1;
v_num2 NUMBER :=1;
v_num3 NUMBER :=1;
begin
  while v_num <= 100 loop
  --  dbms_output.put_line(v_num);
    -- oracel 里 没有 i++;这种写法
    v_num := v_num+1;
  end loop;
  
  
  
  -- 示例2：使用 loop exit(或者when) endd loop; 来判断当摸个条件成立的时候跳出循环体
  -- 继续打印 数字的1到 100
  -- 推荐使用loop 循环，因为这种循环在使用光标的时候比较简单
  LOOP
    EXIT when v_num2 > 100;
   -- dbms_output.put_line(v_num2); 
    v_num2 := v_num2+1;
  end loop;
  
  -- 示例3：使用for 循环打印出1~100
  for i in 1..100 loop
  --注意：这是表示 i 是 1 到 100 里的值,这里的  .. 表示连续的值
  dbms_output.put_line(i);
  end loop;
  
  
end;
/


