-- ���� 1����Ҫ��ЩSQL��� 2������Ҫ��Щ����

-- SQL���
-- ����Щ����
--select deptno from dept;
-- ---->���--->ѭ��--->�˳����������%notfound

-- ������Ա����нˮ������Ҫ�����Ų�ѯ����ô����Ҫ���벿�ű��
--select sal from emp where deptno = ?;  -->����һ����һ�������Ĺ�� ��

--  �������--->ѭ������Ա��ͳ�Ƶ��ܹ��ʺ����� �����Ա���ļ����� --���˳����� --��notfound

--������ÿ���ε�Ա��
--DEPTNO	NUMBER
--COUNT1	NUMBER
--COUNT2	NUMBER
--COUNT3	NUMBER
--DEPTTOTALSAL	NUMBER
--DEPTTOTALSAL ����εõ�������1��select sum(sal) from emp where deptno =deptno;
--Ҳ����ʹ�����ݼ�������ۼ�

declare
cursor cdept is select deptno from dept;
pdept emp.deptno%type;

--�����벿����صĹ��
cursor csal(dno number) is select sal from emp where deptno=dno;
psal emp.sal%type;

--���������������Ͳ�����нˮ�ı���
DEPTNO	NUMBER;
COUNT1	NUMBER;
COUNT2	NUMBER;
COUNT3	NUMBER;
DEPTTOTALSAL	NUMBER;

begin
DELETE FROM msg;
 OPEN cdept;
  loop
  COUNT1:=0;
  COUNT2:=0;
  COUNT3:=0;
  DEPTTOTALSAL:=0;
  fetch cdept into pdept;
  exit when cdept%notfound;
    
    select sum(sal) into DEPTTOTALSAL from emp where deptno = pdept;
    open csal(pdept); --open ��ʱ��һ��Ҫ������������ʱ��Ҫ������
      loop
        --���������������ÿ�����ϵ�����
        fetch csal into psal;
          exit when csal%notfound;-- ���ﲻ��д�� csal(pdept)
        if psal<3000 then
          COUNT1:=COUNT1+1;
        elsif psal>3000 and psal<6000 then 
          COUNT2:=COUNT2+1;
        else
          COUNT3:=COUNT3+1;
        end if;
      end loop;
      -- ���һ��ͳ�� ������в���һ����¼
      insert into msg values(pdept, count1, count2, count3, nvl(DEPTTOTALSAL, 0));
    close csal;  -- ע�������ڹرո��α�ʱ��Ҫ��������������벻ͨ��
  end loop;
    -- ��ÿ�����ŵļ������ڽ�����һ�����ŵ�ʱ���ʼ��
 CLOSE cdept;
  commit;
  dbms_output.put_line('ͳ�����');
end;
/

select * from msg


