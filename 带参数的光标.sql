-- ����������Ĺ��
-- ��ѯ�������ŵ�����Ա������
set serveroutput on;
declare
-- ������
cursor cemp(dno NUMBER) is select ename from emp where emp.deptno = dno;
-- �������
cname emp.ename%type;
begin
  -- �򿪹��\����ֵ��
  open cemp(10);
  loop
    -- ��ȡһ����¼
    fetch cemp into cname;
    exit when cemp%notfound;
    dbms_output.put_line('name is:' ||cname);   
  end loop;
  -- �رչ��Ŷ
  close cemp;
end;
/