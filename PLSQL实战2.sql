-- 涨工资问题
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
  -- 涨工资之前也要哦检验一下给该员工涨完工资，工资总额是否也会超过5W
  if totalSal+psal*1.1<50000 THEN
   UPDATE emp set sal = sal*1.1 where empno = pempno;
    empcount:=empcount+1;
    totalSal:=totalSal+psal*0.1;
  else exit;
  end if;
  end loop;
  close cemp; 
 COMMIT;
 dbms_output.put_line('总人数：'||empcount||'       总工资：'||totalSal);
end;
/