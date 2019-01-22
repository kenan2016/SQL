-- 校验涨前的工资不能比涨后的工资低
-- 很明显我们要对更新的每一条记录都做校验 这是一个行级触发器
create or replace trigger securitySal
before update on emp
for each row
--declare
begin
  if :old.sal > :new.sal then
    --  手动抛出异常、阻止该更新操作， 并给出错误码和提示信息  这个错误码 可以重复，但是不推荐重复。一般都不要重复。这样我们可以自己维护一个数据字典、轻松找到程序或数据库中发生的异常
    raise_application_error(-20002,'涨工资后的工资不能比涨后的工资低,:old-->'||:old.sal||'    new:-->'||:new.sal);
  end if;
end;
/
-- select * from emp 
-- update emp  set sal=sal-1000 where deptno=30;  
update emp  set sal=sal+1 where deptno=30;
ROLLBACK;