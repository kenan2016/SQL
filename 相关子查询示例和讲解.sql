-- https://blog.csdn.net/yuandi_xia/article/details/42197133?utm_source=blogxgwz6

--����Ӳ�ѯ���Ӳ�ѯ�����ڸ���ѯ��������ĳ�����ԡ�����Ӳ�ѯִ�в�ֹһ��

--����Ӳ�ѯ������� exists (ν��) һ��ʹ��

--
--��1��������ѯ��ȡ��һ��Ԫ�飬��Ԫ������е�ֵ�����ڲ��ѯ��
--
--��2��ִ���ڲ��ѯ���õ��Ӳ�ѯ������ֵ��
--
--��3�����ѯ�����Ӳ�ѯ���صĽ���������õ������������С�
--
--��4��Ȼ������ѯȡ����һ��Ԫ���ظ�������1-3��ֱ������Ԫ��ȫ��������ϡ� 


--��ѯBooka���д��ڸ���ͼ��۸�ƽ��ֵ��ͼ����Ϣ
SElECT ͼ����,������,����,�۸�
FROM Books As a
WHERE �۸� >
(
SELECT AVG(�۸�)
FROM Books AS b
WHERE a.����=b.����
)
GO

--���﷨�������Ϊ��������ѯ�����ݣ��ŵ��Ӳ�ѯ����������֤��������֤�����TRUE �� FALSE������������ѯ�����ݽ���Ƿ���Ա�����

--��ѯemp �����������쵼��Ա����Ϣ Ҫ��ʹ�� exists �ؼ���
-- ����һ������Ӳ�ѯ�����
--����Ҫ�����exist�ؼ��ֵ� ����
-- ������ѯ�����ݣ��ŵ��Ӳ�ѯ����������֤��������֤�����TRUE �� FALSE������������ѯ�����ݽ���Ƿ���Ա�����
--select * FROM emp e1 where  EXISTS (select * from emp e2 where e2.mgr = e1.empno )



select * from emp e1 where EXISTS 
(select * from emp e2 where e2.mgr = e1.empno);


-- ��ѯ�����������쵼��Ա����Ϣ
select * from emp e1 where EXISTS (select 1 from emp e2 where e2.mgr = e1.empno);



select a.* from A a 
where exists(select 1 from B b where a.id=b.id)

�﷨�ȼ���
select * from A
where id in(select id from B)

-- �������쵼��Ա����Ϣ
select * FROM emp e1 where EXISTS (select 1  from emp e2 where e1.empno = e2.mgr )



sql��in��exists������Ч������ ת
�ٶ��Ŀ�,��Ҳ��֪�����ĵ�

��

in ��exists
in�ǰ������ڱ���hash ���ӣ���exists �Ƕ������loop ѭ����ÿ��loop ѭ���ٶ��ڱ���в�ѯ��

һֱ������Ϊexists ��in Ч�ʸߵ�˵���ǲ�׼ȷ�ġ������ѯ���������С�൱����ô��in ��exists ��𲻴�

 

�����������һ����С��һ���Ǵ�����Ӳ�ѯ������exists���Ӳ�ѯ��С����in��

���磺

��A��С������B�����1��

 

select * from A where cc in (select cc from B)
 

Ч�ʵͣ��õ���A ����cc �е�������

 

select * from A where exists(select cc from B where cc=A.cc)
 

Ч�ʸߣ��õ���B ����cc �е�������

 

�෴��2��

 

select * from B where cc in (select cc from A)
 

Ч�ʸߣ��õ���B ����cc �е�������

 

select * from B where exists(select cc from A where cc=B.cc)
 

Ч�ʵͣ��õ���A ����cc �е�������

 

 

not in ��not exists
�����ѯ���ʹ����not in ��ô���������ȫ��ɨ�裬û���õ�������

��not extsts ���Ӳ�ѯ��Ȼ���õ����ϵ����������������Ǹ������not exists ����not in Ҫ�졣

��

---select e1.* from emp e1
EMPNO                  ENAME      JOB       MGR                    HIREDATE                  SAL                    COMM                   DEPTNO                 
---------------------- ---------- --------- ---------------------- ------------------------- ---------------------- ---------------------- ---------------------- 
7566                   JONES      MANAGER   7839                   02-4�� -81                4791.27                                       20                     


select *  from emp e2
--select 1  from emp e2 where e1.empno = e2.mgr 


-- ��ѯ�������쵼��Ա������Ϣ
-- select e1.* from emp e1 where EXISTS (select 1 from emp e2 WHERE e1.mgr = e2.empno) 
select * FROM emp e1 where EXISTS (select 1  from emp e2 where e1.empno = e2.mgr  )
select 1  from emp e2 where 7369   = e2.mgr 

select empno  from emp e2
--��ѯ�������쵼��Ա����Ϣ
select e1.*, DISTINCT mgr from  emp e1 where EXISTS (select 1  from emp e2 where e1.mgr =  e2.empno) 
-- �ȼ���
select * from emp e1 where e1.empno in (select e2.mgr from emp e2) 
select * from emp e1 where not EXISTS 
(select * from emp e2 where e2.mgr = e1.empno);
-- ���в����쵼��Ա��
select * from emp e1 where not EXISTS (select * from emp e2 where e1.empno = e2.mgr)