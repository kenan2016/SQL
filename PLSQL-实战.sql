-- PLSQ������ƺ�����ͨͨ�������һ����һ��ָ�Ҫ��ƺ���ϸ���
-- ��Ҫ����Ǵ�ϵͳ�ļܹ��ϻ��߳���ļܹ��϶Գ��� ��������
-- ��ϸ����Ǿ��嵽����ģ�顢���ݽṹ���ӿڶ��塢�����㷨�����Ǳ����Ķ���

-- ������Ƴ����ٲ�ģ��  �������-->���-->����--->����-->����
-- ����һ��ͳ��ÿ����ְ��Ա������
-- ����Ĭ��֪�� Ա����ְ��ݷֲ��� 1980��1981��1982��987 �⼸�����


--PLSQL �����Ļ���˼·  ��������Щ����ʼֵ����Щ����εõ�

-- ˼·������ ��������Ҫ֪��Ա����ְ����� select hiredate from emp;
-- ȡ������һ������ѭ��--> ��Ӧ���-->�˳�����  notfound
-- ������������Щ1:ÿ����ְ��Ա��������Ϊ��4����ݡ���ô���Ƕ����ĸ��������ֱ���� 4�� ��ݵ���ְԱ���� count80 number....
-- ��˼�� �⼸�������ĳ�ʼֵ�Ƕ��� ��  Ϊ0      ���ս����εõ�
set serveroutput on;

declare
-- �����α�
cursor cemp is select to_char (hiredate, 'yyyy') from emp;
-- �������������ֵ
phiredate VARCHAR2(4);
-- ���ĸ���ݶ�Ӧ�������ļ�����
count80 NUMBER;
count81 NUMBER;
count82 NUMBER;
count87 NUMBER;

begin

  -- ���α�
  open cemp;
    count80:=0;
    count81:=0;
    count82:=0;
    count87:=0;
    LOOP
      -- ��ȡһ����¼
      fetch cemp into phiredate;
      EXIT WHEN cemp%notfound;
      if phiredate = '1980' then 
      count80 := count80+1;
      end if;
      if phiredate = '1981' then 
      count81 := count81+1;
      end if;
      if phiredate = '1982' then 
      count82 := count82+1;
      end if;
      if phiredate = '1987' then 
      count87 := count87+1;
      end if;
    end loop;
  close cemp;
  dbms_output.put_line('��������'||(count80+count81+count82+count87) || '     80�꣺'||count80 || '   81�꣺'||count81 || '   82�꣺'|| count82 || ' 87�꣺'||count87);
end;
/

