-- Oracle  ��������
-- ��ѯ�����﹤����ߵ�Ա����Ϣ
 -- һ���ѯ�� �Ȱ����ŷ����ѯ��ÿ�����ŵ����н��Ȼ����Ա������
 select t1.ename,t1.ename,t1.deptno,t1.sal,t1.job from scott.emp t1, 
 (select MAX(t.sal) sal, t.deptno FROM scott.emp t GROUP by t.deptno ) t2
 where t1.deptno = t2.deptno AND t1.sal = t2.sal;
 
 
 --select sal  FROM scott.emp t WHERE t.ename = 'KING';
 
 
 -- ˼·2 ʹ�� Over() �����������߽з�������
 -- ��ʹ�ùؼ���ʹ����������Ȼ��ȡ���ֺ�����������ݵĵ�һ��
 -- partition  ���ڽ����ݷ���  --ע��Ҫ�ͺ�row_number()��rank()��dense_rank()����һ��ʹ��
 select * FROM emp t ;
 select t.* from  (select rank() over(partition by deptno ORDEr by sal DESC) as row_num, t.* FROM emp t ) t where t.row_num = 1;
 
 -- ��ѯԱ�����������š�нˮ������ѯ��Ա��нˮ������Ա�����ڲ�����ߣ����нˮ�Ĳ�ֵ
 -- �Ȳ�����ŵ� ������нˮ
 --���Ա����Ϣ....
 select t1.ename, t1.deptno, t1.sal, t2.maxsal, t2.minsal, t1.sal-t2.maxsal, t1.sal - t2.minsal from emp t1,(
 select max(t.sal) maxsal, min(t.sal) minsal , t.deptno deptno FROM emp t GROUP by t.deptno) t2
 where t1.deptno = t2.deptno;
 
 
 -- ˼·2  ʹ��over()�������� ��� min()/max() over(partition by ...)
 select t.sal,t.deptno, t.ename,
 min(t.sal) OVER (PARTITION BY deptno ORDER BY sal asc) as minsal,
 MAX(t.sal) OVER(PARTITION BY deptno ORDER BY sal desc) as maxsal,
 t.sal-min(t.sal) OVER(PARTITION BY deptno ORDER BY sal asc)  as diff_min,
 t.sal-nvl(MAX(t.sal) OVER(PARTITION BY deptno ORDER BY sal desc), 0) as diff_max
 from emp t;
 
 
-- Orcle��ѯ���˹�������Լ���һλ����һλ�Ĺ��ʵĲ��

-- �������
-- Orcle��ѯ���˹�������Լ���һλ����һλ�Ĺ��ʵĲ��
INSERT INTO TBL_TEST(ID,NAME,PID) VALUES('1','10','0');
INSERT INTO TBL_TEST(ID,NAME,PID) VALUES('2','11','1');
INSERT INTO TBL_TEST(ID,NAME,PID) VALUES('3','20','0');
INSERT INTO TBL_TEST(ID,NAME,PID) VALUES('4','12','1');
INSERT INTO TBL_TEST(ID,NAME,PID) VALUES('5','121','2');

-- ���ײ��ű�
CREATE TABLE TBL_TEST
(
 ID NUMBER,
 NAME VARCHAR2(100 BYTE),
 PID NUMBER DEFAULT 0
);
-- ��Root����ĩ�ҵݹ�
select * from TBL_TEST
start with id=1
connect by prior id = pid


--��ĩ������ROOT�ݹ�
select level ,t.* from TBL_TEST t
start with id=(select max(id) from TBL_TEST)
connect by prior  pid=id ;

Select * FROM TBL_TEST t start with id=1
CONNECT BY PRIOR

--�ɸ��ڵ���Ҷ�ӽڵ������״�ṹ�Ĺ��� ���е�һ����ڶ��㹹���ṹ���
select level ,t.* from  tbl_test t
START with t.pid = 0
CONNECT by PRIOR id = pid


-- ��Ҷ�ӽڵ�����ڵ㹹�����ṹ
select level ,t.* from  tbl_test t
START with t.pid = 4
CONNECT by PRIOR  id =pid


select level,t.* from TBL_TEST t
start with id=5
connect by prior pid = id��;


select level, t.* from tbl_test t 
start with id = 1
CONNECT BY  pid =PRIOR id

-- ����Ҫ����һ�� �Ӹ��ڵ���������ӽڵ� �Լ��ӽڵ�������ӽڵ�  ��������ǶԵġ�
--connect_by_isleaf���������жϵ�ǰ�ڵ��Ƿ�����¼��ڵ㣬��������Ļ���˵������Ҷ�ӽڵ㣬���ﷵ��0����֮������������¼��ڵ㣬���ﷵ��1��
select CONNECT_BY_ISLEAF, level, t.* from tbl_test t 
start with pid = 0
CONNECT BY  pid =PRIOR id -- pid =PRIOR id  ���д���� ��ʾ���ݿ����ݵ�ǰid ������pid��id ��ͬ�ļ�¼






-- ��ѯ���˹�������Լ����ڲ����¸�һλ����һλ�Ĺ��ʵĲ��
-- ��ѯ���˹�������¸�һλ����һλ�Ĺ��ʵĲ��

-- ʹ�÷�������
--lag(), lead()

--��ѯ���˹�������Լ����ڲ����¸�һλ����һλ�Ĺ��ʵĲ��
--��Ȼ�Ǳ�����˵��Ҫ���ղ��ŷ��顢��Ȼ�Ǹ�һλ�͵�һλ����ô���� ʹ�� lag()���� lead�������ú���ʵ��
-- �����ݷ���
select t.ename, t.deptno,t.empno,t.sal,
--ʹ�÷��������������ݷ���\ lead() �������N�����ݡ���ѯǰN��������Ϊ��
lead(t.sal,1,0) over(partition by t.deptno order by t.sal desc) as next_rec_sal,
lag(t.sal,1,0) over(partition by t.deptno order by t.sal desc) as pre_rec_sal,
-- �����ֵ
t.sal-lead(t.sal,1,0) over(partition by t.deptno order by t.sal desc) as diff_next_rec_sa,
t.sal- lag(t.sal,1,0) over(partition by t.deptno order by t.sal desc) as diff_pre_rec_sa
 from scott.emp t;
 
 
 
 --FIRST_VALUE/LAST_VALUE() OVER(PARTITION BY ...) ȡ��β��¼
 -- ����ȡ�ס�ĩ�е�һ����Ϊ�µ�һ��
  SELECT E.EMPNO,
        E.ENAME,
        E.JOB,
        E.MGR,
        E.SAL,
        E.DEPTNO,
        FIRST_VALUE(E.SAL) OVER(PARTITION BY E.DEPTNO) FIRST_SAL,
        LAST_VALUE(E.SAL) OVER(PARTITION BY E.DEPTNO) LAST_SAL
   FROM scott.EMP E;
   
   -- ȫ��ȡ�ס�ĩ����ĩ���ֶ�ֵ��Ϊ�µ�һ��
     SELECT E.EMPNO,
        E.ENAME,
        E.JOB,
        E.MGR,
        E.SAL,
        E.DEPTNO,
        FIRST_VALUE(E.SAL) OVER(order by E.sal) FIRST_SAL,
        LAST_VALUE(E.SAL) OVER(order  BY E.sal) LAST_SAL
   FROM scott.EMP E;
   
   
   -- 5��ROW_NUMBER() OVER(PARTITION BY.. ORDER BY ..) ����Ӧ�ã���ҳ��
   
   -- ���ڷ�ҳ�����кţ�
   SELECT E.ENAME, E.JOB, E.SAL, E.DEPTNO,E.ROW_NUM
   FROM (SELECT E.ENAME,
                E.JOB,
                E.SAL,
                E.DEPTNO,
                ROW_NUMBER() OVER(PARTITION BY E.DEPTNO ORDER BY E.SAL) ROW_NUM -- ���ݲ��ŷ��飬����н�����򲢸�����ÿһ��Ա����¼���к�
           FROM scott.EMP E) E
  WHERE E.ROW_NUM >0;
  
  
  -- ���ݲ��ŷ��飬����н�����򲢸�����ÿһ��Ա����¼���к�   ʹ�� row_number() ���ú��� �� ��������over() ���ʵ��
  
select t.row_no ,t.ename,t.deptno, t.sal, t.empno from (
 select t.ename,t.deptno, t.sal, t.empno,
        -- ���к� ���з�����������򡢸����������ݵ���������ɸѡ����ǰ����
        row_number() over(partition by t.deptno order by t.sal) as row_no
 from scott.emp t
) t where  row_no>3;

-- ȫ������
select t.row_no ,t.ename,t.deptno, t.sal, t.empno from (
 select t.ename,t.deptno, t.sal, t.empno,
        -- ���к� ���з�����������򡢸����������ݵ���������ɸѡ����ǰ����
        row_number() over(order by t.sal) as row_no
 from scott.emp t
) t where  row_no>0 and row_no<10;

-- oracle ��ҳ
select * from scott.emp where rownum>=2; -- ���ܶ�ROWNUMʹ��>������1����ֵ����>=�����ڻ����1����ֵ����=�����ڻ����1����ֵ���������޽��
-- ���� ��ʹ�� С��<

select * from scott.emp where rownum<2; -- ���ܶ�ROWNUMʹ��>������1����ֵ����>=�����ڻ����1����ֵ����=�����ڻ����1����ֵ���������޽��

--�����Ҫ��rownum����1��ʼ���谴���淽��ʹ��
-- ��ҳ��ѯ1
select t.* from (select rownum rn,  t.* from scott.emp t ) t where rn>0 and rn<10;

-- oracle  ��ҳ��ѯ https://www.cnblogs.com/jay763190097/p/6813792.html�Ƽ��̳�

-- Oracle  ͨ�÷�ҳ��ѯ
select t.*  from (select rownum rn, t.* from scott.emp t where rownum<10) t where rn >0; 


-- Oracle  �����������;ۺϺ������ʹ��
-- ʾ������ѯ���ڵ�ƽ��нˮ������������нˮ

  select t.ename,t.empno, t.sal,t.deptno,
  sum(t.sal) over(partition by t.deptno) as part_sum, -- ÿһ�����нˮ��
  avg(t.sal) over(partition by t.deptno) as  part_avg,-- ÿһ���ƽ��нˮ��
  count(t.empno) over(partition by t.deptno) as part_count --ÿһ����ܼ�¼��
   from scott.emp t;  
   
 
 --ʾ��2��ȫͳ�ƣ���Ϊ���ݼ�ͳ�Ʋ��������ܺͣ�ȫ��˾�����ܺͣ��������۾�ֵ��ȫ��˾���۾�ֵ
 
 
select t.ename,t.empno, t.sal,t.deptno,
sum(t.sal) over(partition by t.deptno) as part_sum, -- ÿһ�����нˮ��
avg(t.sal) over(partition by t.deptno) as  part_avg,-- ÿһ���ƽ��нˮ��
count(t.empno) over(partition by t.deptno) as part_count, --ÿһ����ܼ�¼��
avg(t.sal) over() as all_avg
 from scott.emp t;  
 
 
select * from LEARN_FUN_KEEP ;

-- rows/range between �� preceding and �� following ���·�Χ����ֵ
 SELECT E.DEPTNO,
       E.EMPNO,
       E.ENAME,
       E.SAL,
       LAST_VALUE(E.SAL) OVER(PARTITION BY E.DEPTNO ORDER BY E.SAL ROWS
       /*MAX(E.SAL) OVER(PARTITION BY E.DEPTNO ORDER BY E.SAL ROWS*/
       --unbounded preceding and unbouned following��Ե�ǰ���м�¼��ǰһ������һ����¼��Ҳ���Ǳ��е����м�¼
       --unbounded�����ܿ��Ƶģ����޵�
       --preceding����...֮ǰ
       between current row and 2 following
       
      -- following  --����...֮��
        --BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        
        ) MAX_SAL
  FROM scott.EMP E;
  
  
  select t.ename,t.sal,t.deptno,
   sum(t.sal) over(PARTITION BY t.deptno order by t.sal
     rows between current row and 2 following)
    from scott.emp t;

-- ��ʾ������Ա���Ĺ��ʣ���������ʾ�ò��ŵ���߹���
-- ����1   ---order by t.sal desc   ����ǧ��Ҫ�� desc ������
select 
t.empno,t.ename,t.sal,t.deptno,
last_value(t.sal) over (partition by t.deptno ) as max_val 
 from scott.emp t;
 
 -- ��ʾ������Ա���Ĺ��ʣ���������ʾ�ò��ŵ���߹���
 -- ����2
 select 
t.empno,t.ename,t.sal,t.deptno,
max(t.sal) over (partition by t.deptno order by t.sal desc) as max_val 
-- ȡ��λ��¼
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
-- ע�Ⱑ����FIRST_VALUE��LAST_VALUE ǧ��Ҫ����



select t.* from scott.dept t;
select *  from dept   connect by prior mgrno=deptno ;