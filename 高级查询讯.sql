-- �ַ��麯��
--��ѯԱ����ƽ�����ʺ��ܹ���
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
-- ������job �� 5�֡� ������dept �� 3�֣�   ��������ź�deptno,job �����ֶη����� 9��(��group by  ˳���޹�)
--Oracle ���ֶη��飬�Ȱ���һ���з��飬Ȼ���յڶ��з��� ����һ����ͬ�ķֳ�һ�飬Ȼ���յڶ�������


--having �Ӿ�
select deptno, AVG(sal) FROM emp group by deptno having AVG(sal)>3000 ;


select * FROM emp order by 1

select MAX(AVG(sal)) FROM emp GROUP by deptno;

select t.deptno,t.job, sum(sal) from emp t group BY rollUp(  deptno,job);

select  sum(sal) from emp t group BY null;


select * from emp group by rollup(sal) ;;


-- ����ֵ����ʾ����
--��ѯÿ��Ա����Ϣ+�������ơ����ʵȼ�
select e.ename, e.deptno, e.sal, d.dname, s.grade from emp e, dept d, salgrade s where e.deptno = d.deptno and e.sal BETWEEN s.losal AND s.hisal

-- ͳ��ÿ�����ŵ���������������Ϊ0ҲҪ��ʾ
-- ע��count ��һ��Ҫ���ֶ��������������� 1
select d.deptno, count(e.empno) from emp e, dept d where e.deptno(+) = d.deptno group BY d.deptno

-- ��ѯԱ������Ա���ϰ����Ϣ
select e.ename, nvl(b.ename, '��û���ϰ�') from emp e, emp b WHERE e.mgr = b.empno(+)


-- �ݹ��ѯ
-- e.empno = e.mgr ��ʾ ���ϣ����ڵ�ģ� empno = ���ڵ�� mgr �ڵ�
select * from emp e CONNECT BY PRIOR e.empno = e.mgr START WITH empno = 7;

-- �ݹ��ѯ
-- e.empno = e.mgr ��ʾ ���ϣ����ڵ�ģ� empno = ���ڵ�� mgr �ڵ㡣 
--CONNECT_BY_ISLEAF ����������ĩ�˵�ֵ������˵�����֦���Ѿ�û����Ҷ��    0 ��ʾ ���������û���ӽڵ㣬û���ӽڵ㷵��1  ���ӽڵ㷵��0
--
--connect_by_iscycle  ���³�����ѭ�����Ǹ���֦
select level,connect_by_isleaf, empno, ename, mgr from  emp e CONNECT BY PRIOR e.empno = e.mgr START WITH e.mgr is  NULL order by level;