-- if ��� ��3����ʽ
/*
if then
  
end if;

if then
elsif
end if;

if then 
elsif then
elsif  then
else 
end if;
*/


-- ���� -- ʹ�� if ����ж��û��Ӽ��������������
-- �����plsql�н��ռ������루ע�⣬Oracle�С����ǴӼ���������� ���ݶ����ַ�����

-- �� ����̨��� 
set serverout on
-- ʹ�� accept ָ�� �� ��������   prompt ��������ʾ
-- ע�⣬num  ��һ����ֵַ ��仰���� �ǣ����õ�ַ�ϴ���������ֵ
accept num prompt '������һ������:';

declare 
-- ���������ŵ�ַ�ϵ�ֵ��������������������ʱ��ֱ�Ӹı�����ֵ��
pnum number := &num;
begin
  -- dml���
  -- ���̿������
  -- oracle ;���ж������ =   ����ֵ��� ��  := 
  -- �ٴ�˵һ�£������ֵ��һ���ַ�����ֻ�� ��������Oracle �������е�ת������
  if pnum=1 then
    dbms_output.put_line('���������1');
  elsif pnum=2 then
    dbms_output.put_line('���������2');
  elsif pnum=3 then
    dbms_output.put_line('���������3');
  else
    dbms_output.put_line('�����������������');
  end if;
end;
/


