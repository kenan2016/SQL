-- 在PLSQL中要注意事务的一致性
declare 
-- 申明游标 、根据员工的职位给员工涨工资总裁 以1000 经理800 其他人400
-- 分析需要参数：员工编号、员工职位
cursor cemp is select emp.job, emp.empno from emp ;
--同时申明变量
pjob emp.job%type;
pno emp.empno%type;

begin
  rollback;
  -- 打开游标
  open cemp;
  loop
    --从游标中取一条记录
    fetch cemp into pjob,pno;
    -- 如果游标为空后，退出循环
    exit when cemp%notfound;
    -- 如果不为空则继续执行dml
    if pjob= 'PRESIDENT' THEN
      update emp set sal = sal+1000 where empno=pno;
    elsif pjob='MANAGER' then
      UPDATE emp set sal = sal+800 where empno=pno;
    else 
      UPDATE emp set sal = sal+400 WHERE empno = pno;
    end if;
  end loop;
  close cemp;
  commit;
end;
/
select * from emp

