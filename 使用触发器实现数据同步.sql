--���ٴ������ݱ�
-- create table emp_back as select * from emp;

--��������emp����Ա�����ʸı�ʱ��ͬ�����µ����ݱ���
--create table emp_back as select * from emp;
--drop table emp_back
create or replace trigger sync_emp_sal
after update on emp
for each row
Begin
  -- ����������Ժ��Զ����µ�ֵ�������ݱ��Դﵽ���ݱ��ݵ�Ŀ��
  UPDATE emp_back set emp_back.sal = :new.sal where empno=:new.empno; -- ע������������һ��Ҫ������
end;
/

create table emp_back as select * from emp;