-- ��PLSQL��Ҫע�������һ����
declare 
-- �����α� ������Ա����ְλ��Ա���ǹ����ܲ� ��1000 ����800 ������400
-- ������Ҫ������Ա����š�Ա��ְλ
cursor cemp is select emp.ename, emp.empno from emp ;
--ͬʱ��������
pname emp.ename%type;
pno emp.empno%type;

begin
  loop
    
  end loop;
end