-- Oracle  分析函数
-- 查询部门里工资最高的员工信息
 -- 一般查询是 先按部门分组查询出每个部门的最高薪资然与人员表联查
 select t1.ename,t1.ename,t1.deptno,t1.sal,t1.job from scott.emp t1, 
 (select MAX(t.sal) sal, t.deptno FROM scott.emp t GROUP by t.deptno ) t2
 where t1.deptno = t2.deptno AND t1.sal = t2.sal;
 
 
 --select sal  FROM scott.emp t WHERE t.ename = 'KING';
 
 
 -- 思路2 使用 Over() 开窗函数或者叫分析函数
 -- 先使用关键字使其组内排序，然后取出分好组的组内数据的第一行
 -- partition  用于将数据分组  --注意要和和row_number()、rank()、dense_rank()函数一起使用
 select * FROM emp t ;
 select t.* from  (select rank() over(partition by deptno ORDEr by sal DESC) as row_num, t.* FROM emp t ) t where t.row_num = 1;
 
 -- 查询员工姓名、部门、薪水、并查询该员工薪水和这名员工所在部门最高，最低薪水的差值
 -- 先查出部门的 最高最低薪水
 --查出员工信息....
 select t1.ename, t1.deptno, t1.sal, t2.maxsal, t2.minsal, t1.sal-t2.maxsal, t1.sal - t2.minsal from emp t1,(
 select max(t.sal) maxsal, min(t.sal) minsal , t.deptno deptno FROM emp t GROUP by t.deptno) t2
 where t1.deptno = t2.deptno;
 
 
 -- 思路2  使用over()分析函数 配合 min()/max() over(partition by ...)
 select t.sal,t.deptno, t.ename,
 min(t.sal) OVER (PARTITION BY deptno ORDER BY sal asc) as minsal,
 MAX(t.sal) OVER(PARTITION BY deptno ORDER BY sal desc) as maxsal,
 t.sal-min(t.sal) OVER(PARTITION BY deptno ORDER BY sal asc)  as diff_min,
 t.sal-nvl(MAX(t.sal) OVER(PARTITION BY deptno ORDER BY sal desc), 0) as diff_max
 from emp t;
 
 
-- Orcle查询个人工资与比自己高一位、第一位的工资的差额

-- 建表语句
-- Orcle查询个人工资与比自己高一位、第一位的工资的差额
INSERT INTO TBL_TEST(ID,NAME,PID) VALUES('1','10','0');
INSERT INTO TBL_TEST(ID,NAME,PID) VALUES('2','11','1');
INSERT INTO TBL_TEST(ID,NAME,PID) VALUES('3','20','0');
INSERT INTO TBL_TEST(ID,NAME,PID) VALUES('4','12','1');
INSERT INTO TBL_TEST(ID,NAME,PID) VALUES('5','121','2');

-- 简易部门表
CREATE TABLE TBL_TEST
(
 ID NUMBER,
 NAME VARCHAR2(100 BYTE),
 PID NUMBER DEFAULT 0
);
-- 从Root往树末梢递归
select * from TBL_TEST
start with id=1
connect by prior id = pid


--从末梢往树ROOT递归
select level ,t.* from TBL_TEST t
start with id=(select max(id) from TBL_TEST)
connect by prior  pid=id ;

Select * FROM TBL_TEST t start with id=1
CONNECT BY PRIOR

--由根节点向叶子节点进行树状结构的构建 并有第一层向第二层构建结构层次
select level ,t.* from  tbl_test t
START with t.pid = 0
CONNECT by PRIOR id = pid


-- 由叶子节点向根节点构建数结构
select level ,t.* from  tbl_test t
START with t.pid = 4
CONNECT by PRIOR  id =pid


select level,t.* from TBL_TEST t
start with id=5
connect by prior pid = id；;


select level, t.* from tbl_test t 
start with id = 1
CONNECT BY  pid =PRIOR id

-- 最主要是用一个 从根节点遍历到其子节点 以及子节点下面的子节点  这个好像是对的。
--connect_by_isleaf函数用来判断当前节点是否包含下级节点，如果包含的话，说明不是叶子节点，这里返回0；反之，如果不包含下级节点，这里返回1。
select CONNECT_BY_ISLEAF, level, t.* from tbl_test t 
start with pid = 0
CONNECT BY  pid =PRIOR id -- pid =PRIOR id  这个写法是 表示数据库会根据当前id 迭代出pid与id 相同的记录






-- 查询个人工资与比自己所在部门下高一位、第一位的工资的差额
-- 查询个人工资与比下高一位、第一位的工资的差额

-- 使用分析函数
--lag(), lead()

--查询个人工资与比自己所在部门下高一位、第一位的工资的差额
--既然是本部门说明要按照部门分组、既然是高一位和第一位，那么就是 使用 lag()、和 lead（）内置函数实现
-- 先数据分组
select t.ename, t.deptno,t.empno,t.sal,
--使用分析函数进行数据分组\ lead() 函数查后N行数据、查询前N行数据作为列
lead(t.sal,1,0) over(partition by t.deptno order by t.sal desc) as next_rec_sal,
lag(t.sal,1,0) over(partition by t.deptno order by t.sal desc) as pre_rec_sal,
-- 计算差值
t.sal-lead(t.sal,1,0) over(partition by t.deptno order by t.sal desc) as diff_next_rec_sa,
t.sal- lag(t.sal,1,0) over(partition by t.deptno order by t.sal desc) as diff_pre_rec_sa
 from scott.emp t;
 
 
 
 --FIRST_VALUE/LAST_VALUE() OVER(PARTITION BY ...) 取首尾记录
 -- 组内取首、末行的一列作为新的一列
  SELECT E.EMPNO,
        E.ENAME,
        E.JOB,
        E.MGR,
        E.SAL,
        E.DEPTNO,
        FIRST_VALUE(E.SAL) OVER(PARTITION BY E.DEPTNO) FIRST_SAL,
        LAST_VALUE(E.SAL) OVER(PARTITION BY E.DEPTNO) LAST_SAL
   FROM scott.EMP E;
   
   -- 全表取首、末行年末个字段值做为新的一列
     SELECT E.EMPNO,
        E.ENAME,
        E.JOB,
        E.MGR,
        E.SAL,
        E.DEPTNO,
        FIRST_VALUE(E.SAL) OVER(order by E.sal) FIRST_SAL,
        LAST_VALUE(E.SAL) OVER(order  BY E.sal) LAST_SAL
   FROM scott.EMP E;
   
   
   -- 5、ROW_NUMBER() OVER(PARTITION BY.. ORDER BY ..) 排序（应用：分页）
   
   -- 组内分页（加行号）
   SELECT E.ENAME, E.JOB, E.SAL, E.DEPTNO,E.ROW_NUM
   FROM (SELECT E.ENAME,
                E.JOB,
                E.SAL,
                E.DEPTNO,
                ROW_NUMBER() OVER(PARTITION BY E.DEPTNO ORDER BY E.SAL) ROW_NUM -- 根据部门分组，根据薪资排序并给组内每一个员工记录加行号
           FROM scott.EMP E) E
  WHERE E.ROW_NUM >0;
  
  
  -- 根据部门分组，根据薪资排序并给组内每一个员工记录加行号   使用 row_number() 内置函数 和 开窗函数over() 组合实现
  
select t.row_no ,t.ename,t.deptno, t.sal, t.empno from (
 select t.ename,t.deptno, t.sal, t.empno,
        -- 开行号 进行分组和组内排序、根据组内数据的排名进行筛选组内前三名
        row_number() over(partition by t.deptno order by t.sal) as row_no
 from scott.emp t
) t where  row_no>3;

-- 全表排序
select t.row_no ,t.ename,t.deptno, t.sal, t.empno from (
 select t.ename,t.deptno, t.sal, t.empno,
        -- 开行号 进行分组和组内排序、根据组内数据的排名进行筛选组内前三名
        row_number() over(order by t.sal) as row_no
 from scott.emp t
) t where  row_no>0 and row_no<10;

-- oracle 分页
select * from scott.emp where rownum>=2; -- 不能对ROWNUM使用>（大于1的数值）、>=（大于或等于1的数值）、=（大于或等于1的数值），否则无结果
-- 但是 可使用 小于<

select * from scott.emp where rownum<2; -- 不能对ROWNUM使用>（大于1的数值）、>=（大于或等于1的数值）、=（大于或等于1的数值），否则无结果

--如果想要用rownum不从1开始，需按下面方法使用
-- 分页查询1
select t.* from (select rownum rn,  t.* from scott.emp t ) t where rn>0 and rn<10;

-- oracle  分页查询 https://www.cnblogs.com/jay763190097/p/6813792.html推荐教程

-- Oracle  通用分页查询
select t.*  from (select rownum rn, t.* from scott.emp t where rownum<10) t where rn >0; 


-- Oracle  分析函数、和聚合函数组合使用
-- 示例：查询组内的平均薪水、总条数、总薪水

  select t.ename,t.empno, t.sal,t.deptno,
  sum(t.sal) over(partition by t.deptno) as part_sum, -- 每一组的总薪水、
  avg(t.sal) over(partition by t.deptno) as  part_avg,-- 每一组的平均薪水、
  count(t.empno) over(partition by t.deptno) as part_count --每一组的总记录数
   from scott.emp t;  
   
 
 --示例2（全统计）：为数据集统计部门销售总和，全公司销售总和，部门销售均值，全公司销售均值
 
 
select t.ename,t.empno, t.sal,t.deptno,
sum(t.sal) over(partition by t.deptno) as part_sum, -- 每一组的总薪水、
avg(t.sal) over(partition by t.deptno) as  part_avg,-- 每一组的平均薪水、
count(t.empno) over(partition by t.deptno) as part_count, --每一组的总记录数
avg(t.sal) over() as all_avg
 from scott.emp t;  
 
 
select * from LEARN_FUN_KEEP ;

-- rows/range between … preceding and … following 上下范围内求值
 SELECT E.DEPTNO,
       E.EMPNO,
       E.ENAME,
       E.SAL,
       LAST_VALUE(E.SAL) OVER(PARTITION BY E.DEPTNO ORDER BY E.SAL ROWS
       /*MAX(E.SAL) OVER(PARTITION BY E.DEPTNO ORDER BY E.SAL ROWS*/
       --unbounded preceding and unbouned following针对当前所有记录的前一条、后一条记录，也就是表中的所有记录
       --unbounded：不受控制的，无限的
       --preceding：在...之前
       between current row and 2 following
       
      -- following  --：在...之后
        --BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        
        ) MAX_SAL
  FROM scott.EMP E;
  
  
  select t.ename,t.sal,t.deptno,
   sum(t.sal) over(PARTITION BY t.deptno order by t.sal
     rows between current row and 2 following)
    from scott.emp t;

-- 显示各部门员工的工资，并附带显示该部门的最高工资
-- 方法1   ---order by t.sal desc   这里千万不要加 desc 的排序
select 
t.empno,t.ename,t.sal,t.deptno,
last_value(t.sal) over (partition by t.deptno ) as max_val 
 from scott.emp t;
 
 -- 显示各部门员工的工资，并附带显示该部门的最高工资
 -- 方法2
 select 
t.empno,t.ename,t.sal,t.deptno,
max(t.sal) over (partition by t.deptno order by t.sal desc) as max_val 
-- 取首位记录
 SELECT E.EMPNO,
        E.ENAME,
        E.JOB,
        E.MGR,
        E.SAL,
        E.DEPTNO,
        FIRST_VALUE(E.SAL) OVER(PARTITION BY E.DEPTNO) FIRST_SAL,
        LAST_VALUE(E.SAL) OVER(PARTITION BY E.DEPTNO) LAST_SAL
   FROM scott.EMP E;

 from scott.emp t;
-- 注意啊是用FIRST_VALUE、LAST_VALUE 千万不要排序



select t.* from scott.dept t;
select *  from dept   connect by prior mgrno=deptno ;