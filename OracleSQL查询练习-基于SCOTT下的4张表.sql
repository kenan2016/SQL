--Oracle ��ѯ��ϰ ����scott���Դ����
-- ����Ӳ�ѯ
--��ϰ������� Ա�����������ľ������ڲ��ŵ�ƽ������
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

-- 62.��ѯ�����쵼����Ϣ��Ҫ��ʹ��exists�ؼ��� ��ע�������ѯ�����쵼 ��Ϣ ������ ��Ա����Ϣ
select e1.ename, empno, e1.mgr,e1.* from emp e1 where EXISTS (select * from emp e2 where e1.mgr = e2.empno) 

--
--select * from emp e1 where not EXISTS 
--(select * from emp e2 where e2.mgr = e1.empno);

-- ���﷨�������Ϊ��������ѯ�����ݣ��ŵ��Ӳ�ѯ����������֤��������֤�����TRUE �� FALSE������������ѯ�����ݽ���Ƿ���Ա�����
-- ��ѯ���в����쵼����Ϣ
select * from emp e1 where not EXISTS 
(select * from emp e2 where e2.mgr = e1.empno);

select * from emp e1 where NOT EXISTS( SELECT * from emp e2 where e2.mgr =  e1.empno)

-- 