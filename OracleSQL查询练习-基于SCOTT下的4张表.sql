--Oracle 查询练习 基于scott中自带表格
-- 相关子查询
--练习“：输出 员工姓名，他的经理所在部门的平均工资
select ename, 
(select avg(sal) 
from emp e2
where e2.deptno=(select deptno FROM emp e3 where e3.empno = e1.mgr) ) 
from emp e1 


SELECT ename,
       (SELECT AVG(sal)
          FROM emp
         WHERE deptno = (SELECT deptno FROM emp e2 WHERE e2.empno = e1.mgr))
  FROM emp e1



SELECT 'ok' FROM dual 
WHERE not EXISTS (SELECT 'cvvbghfgjhjtyjjtyj' FROM dual WHERE 1 = 1);

-- 62.查询所有领导的信息：要求使用exists关键字 ：注意这里查询的是领导 信息 而不是 该员工信息
select e1.ename, empno, e1.mgr,e1.* from emp e1 where EXISTS (select * from emp e2 where e1.mgr = e2.empno) 

--
--select * from emp e1 where not EXISTS 
--(select * from emp e2 where e2.mgr = e1.empno);

-- 该语法可以理解为：将主查询的数据，放到子查询中做条件验证，根据验证结果（TRUE 或 FALSE）来决定主查询的数据结果是否得以保留。
-- 查询所有不是领导的信息
select * from emp e1 where not EXISTS 
(select * from emp e2 where e2.mgr = e1.empno);

select * from emp e1 where NOT EXISTS( SELECT * from emp e2 where e2.mgr =  e1.empno)

-- 