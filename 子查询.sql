-- 查询员工的员工号，姓名，月薪、年薪
select t.*, t.sal*12 from emp  t

-- 理论上 多表查询优于嵌套子查询，但是数据极少的话不一定

-- 查询薪水最低的三名员工

--select * FROM emp t where rownum < 6 order by t.sal  这是错误的

select rownum ,t.* from (select * FROM emp order by sal desc) t where rownum<10

---相关子查询示例
-- 查询员工表中薪水大于本部门平均薪水的员工、但是我们查询到是整表的平均值
select * from  emp WHERE sal > (select AVG(sal) from emp);


--分析：我们可以知道既然需要查出每个部门中比部门平均工资高的员工，那么我们就需要将员工的部门号作为参数传递给子句,以获取每个员工所在部门的平均薪水
-- 相关子查询可以 注意相关子查询必须将主查询表起别名！！！

select t.*,(SELECT AVG(sal) from  emp where deptno = t.deptno ) from emp  t where  t.sal > (SELECT AVG(sal) from  emp where deptno = t.deptno );

select * from emp t WHERE t.sal>any (select sal  FROM emp a where a.deptno = 30)



select * from emp t WHERE t.sal>all (select sal  FROM emp a where a.deptno = 30)


-- Oracle 分页查询
-- Oracle行不能使用》=
-- 按照薪水排名，取出第5到8行

-- 实现思路将 伪列变成不是伪列的值。主要是在子表里 将 rownum 起别名，看做是字表的一个真实的字段。作为排序
--select e3.* from (select rownum rn, e2.* FROM (SELECT * from emp e1 ORDER BY sal) e2 where rownum<8) e3 where rn>5

 select t.rn,t.* from (select rownum rn, t.* from (select * FROM emp ORDER by sal ) t where rownum <8) t where rn>5
 
 
 
 
 
 
 
 
 
 
 
 
 
 -- Orcle 分页查询
 -- 正确写法
 select * from(select rownum rn,e1.* from (select * FROM emp ORDER by sal) e1 where rownum<8) where rn>=5;
 
 -- 错误写法
-- select * from (select rownum rn, e1.* from emp e1 where rownum<8 order by sal ) e2 where rn>=5

--相关子查询示例  查询员工信息，并显示比自己所在部门平均薪水高的员工
select e.*,(select avg(sal) from emp where deptno = e.deptno)  deptAvg from emp e where sal> (select avg(sal) from emp where deptno = e.deptno);



-- 方案2
select  * FROM emp e,(select deptno edno, avg(sal) avgSal FROm emp e group by deptno) e2 where e2.edno = e.deptno AND  sal > avgSal



