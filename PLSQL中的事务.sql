-- ��PLSQL��Ҫע�������һ����
declare 
-- �����α� ������Ա����ְλ��Ա���ǹ����ܲ� ��1000 ����800 ������400
-- ������Ҫ������Ա����š�Ա��ְλ
cursor cemp is select emp.job, emp.empno from emp ;
--ͬʱ��������
pjob emp.job%type;
pno emp.empno%type;

begin
  rollback;
  -- ���α�
  open cemp;
  loop
    --���α���ȡһ����¼
    fetch cemp into pjob,pno;
    -- ����α�Ϊ�պ��˳�ѭ��
    exit when cemp%notfound;
    -- �����Ϊ�������ִ��dml
    if pjob= 'PRESIDENT' THEN
      update emp set sal = sal+1000 where empno=pno;
    elsif pjob='MANAGER' then
      UPDATE emp set sal = sal+800 where empno=pno;
    else 
      UPDATE emp set sal = sal+400 WHERE empno = pno;
    end if;
  end loop;
  close cemp;
  commit;
end;
/
select * from emp

