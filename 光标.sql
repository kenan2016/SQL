-- ���
declare  
-- �򿪹��
cursor cemp is select ename,sal from scott.emp ;
-- ͬʱ��������
pname emp.ename%type;
psal emp.sal%type;

begin
-- �򿪹��
open cemp;
  --�������� 
  loop
  -- ��ȡһ����¼ ע������ڷŵ�˳��
  fetch cemp into pname, psal;
  exit when cemp%notfound;
  dbms_output.put_line(pname||'��нˮ�ǣ�'||psal);
  end loop;
close cemp;
end;