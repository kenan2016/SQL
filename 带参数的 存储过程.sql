-- ����һ�������Ĵ洢����
-- ʵ�ָ�ָ����Ա����100��Ǯнˮ����������
-- �������� �洢�����е�����������������  empno���������� in �����������������  number����������������  ������������������� empno ���������  ������in ������
create or replace
procedure riseSalary
  (
    eno in number )
as
  -- ����һ������
  -- plsql �ж������ �������ñ������� �ֶε�����������Ϊ ����������
  -- ����һ�����������нǰ��нˮ
  psal emp.sal% TYPE;
-- ����һ���Ǻ��нˮ
asal emp.sal% TYPE;
begin
  --�õ�Ա����ǰ��нˮ
  select sal into psal from emp where empno = eno;
  -- ����Ա����100 Ԫ����
  update emp set sal = sal+100 where empno = eno;
  -- ��ѯ �Ǻ��нˮ
  select sal into asal from emp where empno = eno;
  -- һ������£����� ���� �洢��������������ύ���ع�    ������ѭ˭���á�˭�ύ��˭�ع���ԭ��
  -- ������  ������һ������������������洢���� ����������ύ���� �������� �洢�������ύ������
  -- ��������д���ܱ�֤��������������ͬһ��������
  /* begin
  risesalary(7839);
  risesalary(7566);
  commit;
  end;
  /
  */
  -- ���������������
  -- ��ӡǰ��нˮ
  dbms_output.put_line(psal ||'---'|| asal);
end;