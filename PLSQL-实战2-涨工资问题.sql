set serveroutput on;
declare 
   cursor cemp is select empno ,sal from emp order by sal;
   --定义参数
   pempno emp.empno%type;
   psal emp.sal%type;
   countEmp number :=0;
   salTotal number;

   begin
     --得到工资总额的初始值
     select  sum(sal) into salTotal from emp;
     --打开光标
     open cemp;
          loop
              -- 1.工资总额>5w
              exit when salTotal>50000;
              --取一个员工涨工资
              fetch  cemp into  pempno ,psal;
              --2.%notfound
              exit when cemp%notfound;

              --涨工资
              if salTotal+psal*1.1<50000 then
              update  emp set sal = sal*1.1 where empno=pempno;
              --涨工资的人数
              countEmp := countEmp+1;
              --涨后的工资总额
              salTotal := salTotal+psal*0.1;
              else exit;
              end if;  
          end loop;
     --关闭光标
     close cemp;
     dbms_output.put_line('涨工资人数:'||countEmp||  '资总额:'||salTotal);
   end;