-- 用PLSQL编写一段程序、实现按部门分段（6000以上）、（6000，3000）（3000以下）
--统计各工资段的职工人数、以及各个部门的工资总额（工资总额不包括奖金）  并把结果保存到一张表里


---- 先创建表记录结果。
--create table msg(
--  deptno number,
--  count1 number,
--  count2 number,
--  count3 number,
--  deptTotalSal number
--);

-- 分析需要哪些变量和SQL语句

--SQL语句
-- 1、首先要有哪些部门
