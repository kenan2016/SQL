-- �����ͱ���ʾ��

-- �򿪿���̨��ʾ
set serveroutput  on;
declare
-- ������������1
-- ֱ��������
-- v_name varchar2(20);
-- v_salary number(10,2);

-- ʹ�ñ��ֶ�������Ϊ�����ı�������
v_name emp.ename% TYPE;

v_salary emp.sal% TYPE;

begin
-- dml ����+��ֵ
select ename,sal into v_name, v_salary from emp where empno=7839;
-- ��ӡ���
dbms_output.put_line(v_name||'��нˮ�ǣ�'|| v_salary);
end;
/
-- select ename,sal FROM emp��
--select ename,sal into v_name, v_salary from emp where empno=7369;