-- out ����   ��ѯĳ��Ա������������н��ְλ   out�������ã������ �洢���̻�洢�����������ߵ������ �Ժ�OUT ���Է��ظ�������
create or replace PROCEDURE query_emp_info (eno in number,
                                  pename out VARCHAR2,
                                  psal out NUMBER,
                                  pjob out VARCHAR2
                                )
as 
-- ��Ϊ��������ֱ��ʹ�����������Ϊ�������Բ����ٶ����������

begin
  select emp.ename,emp.sal,emp.job into pname,psal,pjob from emp where emp.empno = eno;
end;
-- ���������ֱ�ӷ��ظ��ͻ��ˣ������ߣ���
/