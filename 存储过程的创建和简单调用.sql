/*
���ô洢���̡�����1��
execute   ������дΪexec
�� exec sayhell();

2��������һ���洢�����е�������洢����
�磺
begin 
sayhell();
sayhello();
end;/
*/




/*�����洢����*/
create or REPLACE procedure sayHello
as
-- ˵������
begin
dbms_output.put_line('hello world');
end;
/

�������������Ҫ��������/
begin
 sayhello();
 sayhello();
end
/