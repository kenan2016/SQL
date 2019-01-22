-- 分析 1、需要哪些SQL语句 2、分析要哪些变量

-- SQL语句
-- 有哪些部门
--select deptno from dept;
-- ---->光标--->循环--->退出条件：光标%notfound

-- 部门中员工的薪水但是需要按部门查询。那么就需要传入部门编号
--select sal from emp where deptno = ?;  -->这是一个带一个参数的光标 、

--  》》光标--->循环计算员工统计的总工资和落在 区间的员工的计数器 --》退出条件 --》notfound

--变量：每个段的员工
--DEPTNO	NUMBER
--COUNT1	NUMBER
--COUNT2	NUMBER
--COUNT3	NUMBER
--DEPTTOTALSAL	NUMBER
--DEPTTOTALSAL ：如何得到；方法1：select sum(sal) from emp where deptno =deptno;
--也可以使用数据计算进行累计

declare
cursor cdept is select deptno from dept;
pdept emp.deptno%type;

--定义与部门相关的光标
cursor csal(dno number) is select sal from emp where deptno=dno;
psal emp.sal%type;

--定义人数计数器和部门总薪水的变量
DEPTNO	NUMBER;
COUNT1	NUMBER;
COUNT2	NUMBER;
COUNT3	NUMBER;
DEPTTOTALSAL	NUMBER;

begin
DELETE FROM msg;
 OPEN cdept;
  loop
  COUNT1:=0;
  COUNT2:=0;
  COUNT3:=0;
  DEPTTOTALSAL:=0;
  fetch cdept into pdept;
  exit when cdept%notfound;
    
    select sum(sal) into DEPTTOTALSAL from emp where deptno = pdept;
    open csal(pdept); --open 的时候一定要带参数、其他时候不要带参数
      loop
        --计算各个部门落在每个段上的人数
        fetch csal into psal;
          exit when csal%notfound;-- 这里不能写成 csal(pdept)
        if psal<3000 then
          COUNT1:=COUNT1+1;
        elsif psal>3000 and psal<6000 then 
          COUNT2:=COUNT2+1;
        else
          COUNT3:=COUNT3+1;
        end if;
      end loop;
      -- 完成一次统计 就像表中插入一条记录
      insert into msg values(pdept, count1, count2, count3, nvl(DEPTTOTALSAL, 0));
    close csal;  -- 注意这里在关闭该游标时不要带参数、否则编译不通过
  end loop;
    -- 将每个部门的计数器在进入下一个部门的时候初始化
 CLOSE cdept;
  commit;
  dbms_output.put_line('统计完成');
end;
/

select * from msg


