-- 实施复杂的安全性检查
-- 示例一：非工作时间不允许插入员工
/**
首先明确什么是非工作时间：暂定 周六日和 周一到周五的非9点到晚上5点
1；判断系统时间是不是周末 1去系统时间并计算为周几
select to_char(sysdate,'day') from dual;  
2；为常量'星期六'、'星期日' 的则为非工作时间 in ('星期六','星期日')

对于不在9点到到5点的视为非工作时间   to_number(to_char(sysdate,'hh24')) not between 9 and 17

根据需求我们可以发现我们这个触发器只要将表的插入操作禁用即可，即说明这个触发器针对是表（即这个触发器一个语句级的 触发器、而不是行级触发器）
如何禁用insert 语句呢？我们可以手动抛出一个异常，注意这里的异常必须是应用级别的异常而不是数据库级别的异常 、Oracle 有个函数 raise_application_error(errorCode,'errorMsg')   
-20000~-20999;   oracle 规定自定义的错误代码必须在 -20000 到-20999之间
*/
CREATE OR REPLACE TRIGGER SECURITYEMP
BEFORE INSERT ON EMP
--DECLARE 
BEGIN
-- 非工作时间无法插入数据
  IF to_char (sysdate, 'day') in ('星期六', '星期日') or (to_number(to_char (sysdate, 'hh24')) not between 9 and 17) then
    -- 禁止这个insert操作、我们通过抛出自定义异常来实现
    raise_application_error(-20001, '禁止在非工作时间插入新员工');
  end if;
END SECURITYEMP;
/

select * from emp 


--drop TRIGGER welcomeNewEmp
update 