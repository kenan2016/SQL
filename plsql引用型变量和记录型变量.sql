-- 引用型变量示例

-- 打开控制台显示
set serveroutput  on;
declare
-- 申明变量方法1
-- 直接申明：
-- v_name varchar2(20);
-- v_salary number(10,2);

-- 使用表字段类型作为申明的变量类型
v_name emp.ename% TYPE;

v_salary emp.sal% TYPE;

begin
-- dml 操作+赋值
select ename,sal into v_name, v_salary from emp where empno=7839;
-- 打印结果
dbms_output.put_line(v_name||'的薪水是：'|| v_salary);
end;
/
-- select ename,sal FROM emp；
--select ename,sal into v_name, v_salary from emp where empno=7369;