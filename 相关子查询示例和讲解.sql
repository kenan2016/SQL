-- https://blog.csdn.net/yuandi_xia/article/details/42197133?utm_source=blogxgwz6

--相关子查询：子查询依赖于父查询结果集里的某个属性、相关子查询执行不止一次

--相关子查询可以配合 exists (谓词) 一起使用

--
--（1）从外层查询中取出一个元组，将元组相关列的值传给内层查询。
--
--（2）执行内层查询，得到子查询操作的值。
--
--（3）外查询根据子查询返回的结果或结果集得到满足条件的行。
--
--（4）然后外层查询取出下一个元组重复做步骤1-3，直到外层的元组全部处理完毕。 


--查询Booka表中大于该类图书价格平均值的图书信息
SElECT 图书名,出版社,类编号,价格
FROM Books As a
WHERE 价格 >
(
SELECT AVG(价格)
FROM Books AS b
WHERE a.类编号=b.类编号
)
GO

--该语法可以理解为：将主查询的数据，放到子查询中做条件验证，根据验证结果（TRUE 或 FALSE）来决定主查询的数据结果是否得以保留。

--查询emp 表中所有是领导的员工信息 要求使用 exists 关键字
-- 这是一个相关子查询的语句
--我们要先理解exist关键字的 作用
-- 将主查询的数据，放到子查询中做条件验证，根据验证结果（TRUE 或 FALSE）来决定主查询的数据结果是否得以保留。
--select * FROM emp e1 where  EXISTS (select * from emp e2 where e2.mgr = e1.empno )



select * from emp e1 where EXISTS 
(select * from emp e2 where e2.mgr = e1.empno);


-- 查询表中所有市领导的员工信息
select * from emp e1 where EXISTS (select 1 from emp e2 where e2.mgr = e1.empno);



select a.* from A a 
where exists(select 1 from B b where a.id=b.id)

语法等价于
select * from A
where id in(select id from B)

-- 所有是领导的员工信息
select * FROM emp e1 where EXISTS (select 1  from emp e2 where e1.empno = e2.mgr )



sql中in和exists的区别效率问题 转
百度文库,我也不知道是哪的

“

in 和exists
in是把外表和内表作hash 连接，而exists 是对外表作loop 循环，每次loop 循环再对内表进行查询。

一直以来认为exists 比in 效率高的说法是不准确的。如果查询的两个表大小相当，那么用in 和exists 差别不大。

 

如果两个表中一个较小，一个是大表，则子查询表大的用exists，子查询表小的用in：

例如：

表A（小表），表B（大表）1：

 

select * from A where cc in (select cc from B)
 

效率低，用到了A 表上cc 列的索引；

 

select * from A where exists(select cc from B where cc=A.cc)
 

效率高，用到了B 表上cc 列的索引。

 

相反的2：

 

select * from B where cc in (select cc from A)
 

效率高，用到了B 表上cc 列的索引；

 

select * from B where exists(select cc from A where cc=B.cc)
 

效率低，用到了A 表上cc 列的索引。

 

 

not in 和not exists
如果查询语句使用了not in 那么内外表都进行全表扫描，没有用到索引；

而not extsts 的子查询依然能用到表上的索引。所以无论那个表大，用not exists 都比not in 要快。

”

---select e1.* from emp e1
EMPNO                  ENAME      JOB       MGR                    HIREDATE                  SAL                    COMM                   DEPTNO                 
---------------------- ---------- --------- ---------------------- ------------------------- ---------------------- ---------------------- ---------------------- 
7566                   JONES      MANAGER   7839                   02-4月 -81                4791.27                                       20                     


select *  from emp e2
--select 1  from emp e2 where e1.empno = e2.mgr 


-- 查询所有是领导的员工的信息
-- select e1.* from emp e1 where EXISTS (select 1 from emp e2 WHERE e1.mgr = e2.empno) 
select * FROM emp e1 where EXISTS (select 1  from emp e2 where e1.empno = e2.mgr  )
select 1  from emp e2 where 7369   = e2.mgr 

select empno  from emp e2
--查询所有是领导的员工信息
select e1.*, DISTINCT mgr from  emp e1 where EXISTS (select 1  from emp e2 where e1.mgr =  e2.empno) 
-- 等价于
select * from emp e1 where e1.empno in (select e2.mgr from emp e2) 
select * from emp e1 where not EXISTS 
(select * from emp e2 where e2.mgr = e1.empno);
-- 所有不是领导的员工
select * from emp e1 where not EXISTS (select * from emp e2 where e1.empno = e2.mgr)