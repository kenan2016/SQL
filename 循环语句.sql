-- while loop ѭ��
--  loop when����exit��  ѭ��
-- for ѭ��
set serveroutput on;
-- ʾ��1:   while loop ѭ����ӡ 1��ӡ100
declare
v_num number :=1;
v_num2 NUMBER :=1;
v_num3 NUMBER :=1;
begin
  while v_num <= 100 loop
  --  dbms_output.put_line(v_num);
    -- oracel �� û�� i++;����д��
    v_num := v_num+1;
  end loop;
  
  
  
  -- ʾ��2��ʹ�� loop exit(����when) endd loop; ���жϵ���������������ʱ������ѭ����
  -- ������ӡ ���ֵ�1�� 100
  -- �Ƽ�ʹ��loop ѭ������Ϊ����ѭ����ʹ�ù���ʱ��Ƚϼ�
  LOOP
    EXIT when v_num2 > 100;
   -- dbms_output.put_line(v_num2); 
    v_num2 := v_num2+1;
  end loop;
  
  -- ʾ��3��ʹ��for ѭ����ӡ��1~100
  for i in 1..100 loop
  --ע�⣺���Ǳ�ʾ i �� 1 �� 100 ���ֵ,�����  .. ��ʾ������ֵ
  dbms_output.put_line(i);
  end loop;
  
  
end;
/


