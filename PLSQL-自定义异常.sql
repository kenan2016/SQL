-- plsql �Զ����쳣
-- �����ѷ� �ȶ����쳣 ��ʹ�� raise �ؼ��ֲ����쳣�� �� exception�в����쳣
set serveroutput on;
declare
-- �����α�
cursor cemp is select ename from emp where deptno=555;
-- �������
pname emp.ename%type;
-- �Զ����쳣
ex_no_data exception;

begin
  -- ���α�
  open cemp;
  -- ѭ��
  loop
    fetch cemp into pname;
    if cemp%notfound then 
    -- �׳��쳣
      raise ex_no_data;
    end if;
  end loop;
  -- ע�� ���쳣������ Oracle ���Զ�����һ����pmon ��process mirror ���̼��������Ľ��̣��Զ��ͷ�δ�رյ���Դ 
  close cemp;
  
  -- �����쳣
  exception 
  when ex_no_data then dbms_output.put_line('�쳣������no-datas');
  when others then dbms_output.put_line('others');
end;
/
