-- ���ݿ����
-- ����1����Ա�������Ƿ�����2000ʱ��¼��Ա������Ϣ������һ�ű���
-- �Ƚ�����¼��
create table sal_update_log(
  emp_info varchar2(200)
);

-- ����������
create or  replace trigger sal_up_warnning
after update on emp
for each row
begin 
  if (:new.sal - :old.sal) > 500  then
    insert INTO sal_update_log (emp_info) values ('Ա�����ƣ�'||:new.ename||'          �Ǻ�нˮ:'|| :old.sal||'     ��ǰнˮ��'||:new.sal);
  -- commit;
   -- RAISE_application_error(-20002,'�����Ƿ��쳣');
   -- ע����PLSQL ���ע�� commit���ܳ����� �������й�
  end if;
end;
/
-- ����
drop  trigger SCOTT.SECURITYSAL
update emp set emp.sal = emp.sal+600 where deptno=30;

select * from sal_update_log;

SELECT * from emp where emp.deptno= 30;

delete from sal_update_log

select * from emp_back where deptno= 30;