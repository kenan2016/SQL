-- 数据库审计
-- 案例1：当员工工资涨幅超过2000时记录该员工的信息到另外一张表上
-- 先建立记录表
create table sal_update_log(
  emp_info varchar2(200)
);

-- 创建触发器
create or  replace trigger sal_up_warnning
after update on emp
for each row
begin 
  if (:new.sal - :old.sal) > 500  then
    insert INTO sal_update_log (emp_info) values ('员工名称：'||:new.ename||'          涨后薪水:'|| :old.sal||'     涨前薪水：'||:new.sal);
  -- commit;
   -- RAISE_application_error(-20002,'工资涨幅异常');
   -- 注意在PLSQL 这里，注意 commit不能出现在 触发器中国
  end if;
end;
/
-- 测试
drop  trigger SCOTT.SECURITYSAL
update emp set emp.sal = emp.sal+600 where deptno=30;

select * from sal_update_log;

SELECT * from emp where emp.deptno= 30;

delete from sal_update_log

select * from emp_back where deptno= 30;