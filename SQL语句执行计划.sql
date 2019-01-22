-- SQL语句执行计划
explain plan for select * from emp;
--explain plan 成功。
-- 查看执行计划
-- 固定写法
select * from table(dbms_xplan.display);
select COUNT(1) as t from emp

(select count(*) from emp) total, 
(select count(*) from emp where to_char (hiredate, 'yyyy')='1980') "1980" 






-- 相关子查询
explain plan for select e.*,(select avg( sal) FROM emp where e.deptno = deptno) avg from  emp e where sal>(select avg( sal) FROM emp where e.deptno = deptno)
-- 查看结果
select * from table(dbms_xplan.display);
select (select count(*) from  emp t where to_char(t.hiredate,'yyyy') = '1981') "1981" from dual
-- 没执行一条语句就要看一下记录;
select 
(select count(*)  from  emp)  Total,
(select count(*) from  emp t where to_char(t.hiredate,'yyyy') = '1980') "1980",
(select count(*) from  emp t where to_char(t.hiredate,'yyyy') = '1981') "1981",
  (select count(*) from  emp t where to_char(t.hiredate,'yyyy') = '1982') "1982",
  (select count(*)  from  emp t where to_char(t.hiredate,'yyyy') = '1987') "1987" 
  from dual;
  

  select 
  (select COUNT(*) from  emp ) total,
  (select COUNT(*) from  emp where to_char(hiredate,'yyyy') = '1980')  "1980",
  (select COUNT(*) from  emp where to_char(hiredate,'yyyy') = '1981')  "1981",
  (select COUNT(*) from  emp where to_char(hiredate,'yyyy') = '1982')  "1982",
  (select COUNT(*) from  emp where to_char(hiredate,'yyyy') = '1987')  "1987"
  from dual
  
  
  -- 使用 函数实现
  select 
  count(hiredate) "total",
  SUM(decode(to_char (hiredate, 'yyyy'),'1980',1,0)) "1980",
  SUM(decode(to_char (hiredate, 'yyyy'),'1981',1,0)) "1981",
  SUM(decode(to_char (hiredate, 'yyyy'),'1982',1,0)) "1982",
  SUM(decode(to_char (hiredate, 'yyyy'),'1987',1,0)) "1987"
  from emp  group by deptno
  
  
  
  select pn_cno, wm_concat(sname) pn_c,pn_s where instr(pcsid,psname) >0 group BY pn_cno
  
  select e.deptno, wm_concat( e.ename) from emp e,dept d 
  
  
  
  select e.deptno, wm_concat( e.ename) from emp e,dept d where e.deptno = d.deptno GROUP BY d.deptno
  --where e.deptno = d.deptno  group BY e.deptno
  