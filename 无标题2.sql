-- �ǹ�������
set serveroutput on;
declare
cursor cemp is SELECT empno, sal from emp;
pempno emp.empno%TYPE;
psal emp.sal%TYPE;
empcount number := 0;
totalSal emp.sal%TYPE;
begin
 select sum(sal) into totalSal from emp;
 OPEn cemp;
 loop
  EXIT WHEN totalSal>50000;
  FETCH cemp INTO pempno, psal;
  EXIT WHEN cemp%notfound;
  -- �ǹ���֮ǰҲҪŶ����һ�¸���Ա�����깤�ʣ������ܶ��Ƿ�Ҳ�ᳬ��5W
  if totalSal+psal*1.1<50000 THEN
   UPDATE emp set sal = sal*1.1 where empno = pempno;
    empcount:=empcount+1;
    totalSal:=totalSal+psal*0.1;
  else exit;
  end if;
  end loop;
  close cemp; 
 COMMIT;
 dbms_output.put_line('��������'||empcount||'       �ܹ��ʣ�'||totalSal);
end;
/