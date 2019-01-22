-- PLSQ程序设计和普普通通程序设计一样，一般分概要设计和详细设计
-- 概要设计是从系统的架构上或者程序的架构上对程序 进行描述
-- 详细设计是具体到功能模块、数据结构、接口定义、核心算法甚至是变量的定义

-- 程序设计常用瀑布模型  需求分析-->设计-->编码--->测试-->上线
-- 案例一：统计每年入职的员工人数
-- 假设默认知道 员工入职年份分布在 1980、1981、1982、987 这几个年份


--PLSQL 分析的基本思路  变量有哪些、初始值有哪些、如何得到

-- 思路分析： 我们首先要知道员工入职的年份 select hiredate from emp;
-- 取到的是一个集合循环--> 对应光标-->退出条件  notfound
-- 分析变量有哪些1:每年入职的员工数、因为有4个年份、那么我们定义四个计数器分别代表 4个 年份的入职员工数 count80 number....
-- 再思考 这几个变量的初始值是多少 ？  为0      最终结果如何得到
set serveroutput on;

declare
-- 申明游标
cursor cemp is select to_char (hiredate, 'yyyy') from emp;
-- 定义变量存日期值
phiredate VARCHAR2(4);
-- 定四个年份对应的人数的计数器
count80 NUMBER;
count81 NUMBER;
count82 NUMBER;
count87 NUMBER;

begin

  -- 打开游标
  open cemp;
    count80:=0;
    count81:=0;
    count82:=0;
    count87:=0;
    LOOP
      -- 提取一条记录
      fetch cemp into phiredate;
      EXIT WHEN cemp%notfound;
      if phiredate = '1980' then 
      count80 := count80+1;
      end if;
      if phiredate = '1981' then 
      count81 := count81+1;
      end if;
      if phiredate = '1982' then 
      count82 := count82+1;
      end if;
      if phiredate = '1987' then 
      count87 := count87+1;
      end if;
    end loop;
  close cemp;
  dbms_output.put_line('总人数：'||(count80+count81+count82+count87) || '     80年：'||count80 || '   81年：'||count81 || '   82年：'|| count82 || ' 87年：'||count87);
end;
/

