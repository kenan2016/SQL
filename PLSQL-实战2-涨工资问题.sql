set serveroutput on;
declare 
   cursor cemp is select empno ,sal from emp order by sal;
   --�������
   pempno emp.empno%type;
   psal emp.sal%type;
   countEmp number :=0;
   salTotal number;

   begin
     --�õ������ܶ�ĳ�ʼֵ
     select  sum(sal) into salTotal from emp;
     --�򿪹��
     open cemp;
          loop
              -- 1.�����ܶ�>5w
              exit when salTotal>50000;
              --ȡһ��Ա���ǹ���
              fetch  cemp into  pempno ,psal;
              --2.%notfound
              exit when cemp%notfound;

              --�ǹ���
              if salTotal+psal*1.1<50000 then
              update  emp set sal = sal*1.1 where empno=pempno;
              --�ǹ��ʵ�����
              countEmp := countEmp+1;
              --�Ǻ�Ĺ����ܶ�
              salTotal := salTotal+psal*0.1;
              else exit;
              end if;  
          end loop;
     --�رչ��
     close cemp;
     dbms_output.put_line('�ǹ�������:'||countEmp||  '���ܶ�:'||salTotal);
   end;