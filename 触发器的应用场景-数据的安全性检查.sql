-- ʵʩ���ӵİ�ȫ�Լ��
-- ʾ��һ���ǹ���ʱ�䲻�������Ա��
/**
������ȷʲô�Ƿǹ���ʱ�䣺�ݶ� �����պ� ��һ������ķ�9�㵽����5��
1���ж�ϵͳʱ���ǲ�����ĩ 1ȥϵͳʱ�䲢����Ϊ�ܼ�
select to_char(sysdate,'day') from dual;  
2��Ϊ����'������'��'������' ����Ϊ�ǹ���ʱ�� in ('������','������')

���ڲ���9�㵽��5�����Ϊ�ǹ���ʱ��   to_number(to_char(sysdate,'hh24')) not between 9 and 17

�����������ǿ��Է����������������ֻҪ����Ĳ���������ü��ɣ���˵���������������Ǳ������������һ����伶�� ���������������м���������
��ν���insert ����أ����ǿ����ֶ��׳�һ���쳣��ע��������쳣������Ӧ�ü�����쳣���������ݿ⼶����쳣 ��Oracle �и����� raise_application_error(errorCode,'errorMsg')   
-20000~-20999;   oracle �涨�Զ���Ĵ����������� -20000 ��-20999֮��
*/
CREATE OR REPLACE TRIGGER SECURITYEMP
BEFORE INSERT ON EMP
--DECLARE 
BEGIN
-- �ǹ���ʱ���޷���������
  IF to_char (sysdate, 'day') in ('������', '������') or (to_number(to_char (sysdate, 'hh24')) not between 9 and 17) then
    -- ��ֹ���insert����������ͨ���׳��Զ����쳣��ʵ��
    raise_application_error(-20001, '��ֹ�ڷǹ���ʱ�������Ա��');
  end if;
END SECURITYEMP;
/

select * from emp 


--drop TRIGGER welcomeNewEmp
update 