-- У����ǰ�Ĺ��ʲ��ܱ��Ǻ�Ĺ��ʵ�
-- ����������Ҫ�Ը��µ�ÿһ����¼����У�� ����һ���м�������
create or replace trigger securitySal
before update on emp
for each row
--declare
begin
  if :old.sal > :new.sal then
    --  �ֶ��׳��쳣����ֹ�ø��²����� ���������������ʾ��Ϣ  ��������� �����ظ������ǲ��Ƽ��ظ���һ�㶼��Ҫ�ظ����������ǿ����Լ�ά��һ�������ֵ䡢�����ҵ���������ݿ��з������쳣
    raise_application_error(-20002,'�ǹ��ʺ�Ĺ��ʲ��ܱ��Ǻ�Ĺ��ʵ�,:old-->'||:old.sal||'    new:-->'||:new.sal);
  end if;
end;
/
-- select * from emp 
-- update emp  set sal=sal-1000 where deptno=30;  
update emp  set sal=sal+1 where deptno=30;
ROLLBACK;