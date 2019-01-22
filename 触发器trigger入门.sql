-- 触发器 入门  类似java程序中监听器
--demo1:当员工表插入一个新员工时打印一句话“插入一个新员工”
-- 触发器是与表相关的操作、当对某个指定的表进行insert、 delete、 update 才会执行该触发器、 注意select语句并不会执行触发器
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



