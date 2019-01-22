-- 创建一个参数的存储过程
-- 实现给指定的员工涨100块钱薪水、并输出结果
-- 基本概念 存储过程中的输入参数和输出参数  empno：参数名， in 参数的输入输出类型  number：参数的数据类型  对于我们这个程序来讲 empno 是输入参数  所以用in 来修饰
create or replace
procedure riseSalary
  (
    eno in number )
as
  -- 定义一个变量
  -- plsql 中定义变量 可以引用表中摸个 字段的数据类型作为 变量的类型
  -- 定义一个变量存放涨薪前的薪水
  psal emp.sal% TYPE;
-- 定义一个涨后的薪水
asal emp.sal% TYPE;
begin
  --得到员工涨前的薪水
  select sal into psal from emp where empno = eno;
  -- 给该员工涨100 元工资
  update emp set sal = sal+100 where empno = eno;
  -- 查询 涨后的薪水
  select sal into asal from emp where empno = eno;
  -- 一般情况下，我们 不在 存储过程中做事务的提交、回滚    我们遵循谁调用、谁提交、谁回滚的原则、
  -- 举例子  我们在一个代码块里调用在这个存储过程 我在这里才提交事务 而不是在 存储过程中提交！！！
  -- 下面这种写法能保证这两个操作能在同一个事务当中
  /* begin
  risesalary(7839);
  risesalary(7566);
  commit;
  end;
  /
  */
  -- 但是特殊情况除外
  -- 打印前后薪水
  dbms_output.put_line(psal ||'---'|| asal);
end;