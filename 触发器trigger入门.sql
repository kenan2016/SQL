-- ������ ����  ����java�����м�����
--demo1:��Ա�������һ����Ա��ʱ��ӡһ�仰������һ����Ա����
-- �������������صĲ���������ĳ��ָ���ı����insert�� delete�� update �Ż�ִ�иô������� ע��select��䲢����ִ�д�����
set serveroutput on;
create or replace trigger welcomeNewEmp
after insert on  emp
declare
begin
  dbms_output.put_line('hello world!');
end;
/

--select * from emp
--
insert INto emp (EMPNO,  ENAME, JOB, MGR,HIREDATE, sal, comm,deptno  ) values(1003,'kenan','SALESMAN',7698, sysdate, 3000,300,30);



