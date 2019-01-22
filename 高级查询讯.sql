-- 分分组函数
--查询员工的平均工资和总工资
select t.deptno, wm_concat(t.ename) from emp t group by deptno ;

select deptno, job
, sum(sal)
FROM emp  GROUP BY deptno, job ;


select 
deptno
--job
--, sum(sal)
FROM emp  GROUP BY deptno ;



select deptno,
job
--, sum(sal)
FROM emp  GROUP BY  job,deptno
;


select 
job, 
sum(sal)
FROM emp  GROUP BY job ;
-- 单独查job 有 5种、 单独查dept 有 3种，   如果按部门和deptno,job 两个字段分组有 9种(与group by  顺序无关)
--Oracle 多字段分组，先按第一个列分组，然后按照第二列分组 即第一类相同的分成一组，然后按照第二例分组


--having 子句
select deptno, AVG(sal) FROM emp group by deptno having AVG(sal)>3000 ;


select * FROM emp order by 1

select MAX(AVG(sal)) FROM emp GROUP by deptno;

select t.deptno,t.job, sum(sal) from emp t group BY rollUp(  deptno,job);

select  sum(sal) from emp t group BY null;


select * from emp group by rollup(sal) ;;


-- 不等值连接示例：
--查询每个员工信息+部门名称、工资等级
select e.ename, e.deptno, e.sal, d.dname, s.grade from emp e, dept d, salgrade s where e.deptno = d.deptno and e.sal BETWEEN s.losal AND s.hisal

-- 统计每个部门的人数，部门人数为0也要显示
-- 注意count 的一定要是字段名，，否则会出现 1
select d.deptno, count(e.empno) from emp e, dept d where e.deptno(+) = d.deptno group BY d.deptno

-- 查询员工，和员工老板的信息
select e.ename, nvl(b.ename, '我没有老板') from emp e, emp b WHERE e.mgr = b.empno(+)


-- 递归查询
-- e.empno = e.mgr 表示 向上（根节点的） empno = 本节点的 mgr 节点
select * from emp e CONNECT BY PRIOR e.empno = e.mgr START WITH empno = 7;

-- 递归查询
-- e.empno = e.mgr 表示 向上（根节点的） empno = 本节点的 mgr 节点。 
--CONNECT_BY_ISLEAF 就是树的最末端的值，或者说这个树枝下已经没有树叶了    0 表示 这个树下面没有子节点，没有子节点返回1  有子节点返回0
--
--connect_by_iscycle  导致出现死循环的那个树枝
select level,connect_by_isleaf, empno, ename, mgr from  emp e CONNECT BY PRIOR e.empno = e.mgr START WITH e.mgr is  NULL order by level;