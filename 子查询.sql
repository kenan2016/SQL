-- ��ѯԱ����Ա���ţ���������н����н
select t.*, t.sal*12 from emp  t

-- ������ ����ѯ����Ƕ���Ӳ�ѯ���������ݼ��ٵĻ���һ��

-- ��ѯнˮ��͵�����Ա��

--select * FROM emp t where rownum < 6 order by t.sal  ���Ǵ����

select rownum ,t.* from (select * FROM emp order by sal desc) t where rownum<10

---����Ӳ�ѯʾ��
-- ��ѯԱ������нˮ���ڱ�����ƽ��нˮ��Ա�����������ǲ�ѯ���������ƽ��ֵ
select * from  emp WHERE sal > (select AVG(sal) from emp);


--���������ǿ���֪����Ȼ��Ҫ���ÿ�������бȲ���ƽ�����ʸߵ�Ա������ô���Ǿ���Ҫ��Ա���Ĳ��ź���Ϊ�������ݸ��Ӿ�,�Ի�ȡÿ��Ա�����ڲ��ŵ�ƽ��нˮ
-- ����Ӳ�ѯ���� ע������Ӳ�ѯ���뽫����ѯ�������������

select t.*,(SELECT AVG(sal) from  emp where deptno = t.deptno ) from emp  t where  t.sal > (SELECT AVG(sal) from  emp where deptno = t.deptno );

select * from emp t WHERE t.sal>any (select sal  FROM emp a where a.deptno = 30)



select * from emp t WHERE t.sal>all (select sal  FROM emp a where a.deptno = 30)


-- Oracle ��ҳ��ѯ
-- Oracle�в���ʹ�á�=
-- ����нˮ������ȡ����5��8��

-- ʵ��˼·�� α�б�ɲ���α�е�ֵ����Ҫ�����ӱ��� �� rownum ��������������ֱ��һ����ʵ���ֶΡ���Ϊ����
--select e3.* from (select rownum rn, e2.* FROM (SELECT * from emp e1 ORDER BY sal) e2 where rownum<8) e3 where rn>5

 select t.rn,t.* from (select rownum rn, t.* from (select * FROM emp ORDER by sal ) t where rownum <8) t where rn>5
 
 
 
 
 
 
 
 
 
 
 
 
 
 -- Orcle ��ҳ��ѯ
 -- ��ȷд��
 select * from(select rownum rn,e1.* from (select * FROM emp ORDER by sal) e1 where rownum<8) where rn>=5;
 
 -- ����д��
-- select * from (select rownum rn, e1.* from emp e1 where rownum<8 order by sal ) e2 where rn>=5

--����Ӳ�ѯʾ��  ��ѯԱ����Ϣ������ʾ���Լ����ڲ���ƽ��нˮ�ߵ�Ա��
select e.*,(select avg(sal) from emp where deptno = e.deptno)  deptAvg from emp e where sal> (select avg(sal) from emp where deptno = e.deptno);



-- ����2
select  * FROM emp e,(select deptno edno, avg(sal) avgSal FROm emp e group by deptno) e2 where e2.edno = e.deptno AND  sal > avgSal



