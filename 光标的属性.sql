set serveroutput on;
-- ��������
--notfound�� found
--%isopen �жϹ���Ƿ��
-- rowcount ֱ���������������Oracle ���� Ӱ�������  ���� �α굱����100����¼ �����Ѿ�ȡ���� 10����¼����ô���ʾ��10   ����ǰ�ڼ�����¼
declare
-- �������
  cursor cemp is select ename,sal from emp;
  -- ��������
  cname emp.ename%type;
  csal emp.sal%type;
begin
  --�򿪹��
  open cemp;
  if cemp%isopen then
    dbms_output.put_line('����Ѵ򿪣�');
  else 
    dbms_output.put_line('����Ѵ򿪣�');
  end if;
  LOOP
  FETch cemp into cname, csal;
  EXIT WHEN cemp%notfound;
  dbms_output.put_line('��ǰrowcount is'||cemp%rowcount);
  end loop;
  
  -- �رչ�� (ע�Ⱑһ��Ҫ�رչ�� �� Oracle �� ��������򿪵�һ���̶��Ժ�Ͳ����ٴ���
  --Ĭ������¡�Oracle���ݿ�ֻ������ͬһ���Ự�д�300����ꡢ��ʹ�� Oracle ������鿴 -- ��Ҫ�ڹ���Ա�û��� �鿴)
  close cemp;
end;
/