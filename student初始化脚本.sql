-- create table dep(
--	     dno number(2),
--	     dname  varchar2(30),
--	     director number(4),
--	     tel varchar(8)
--	  );
--
--	  create table teacher(
--	     tno number(4),
--	     tname  varchar2(10),
--	     title  varchar2(20),
--	     hiredate date,
--	     sal number(7,2),
--	     bonus number(7,2),
--	     mgr number(4),
--	     deptno number(2)
--	  );
--
--	  create table student(
--	     sno number(6),
--	     sname  varchar2(8),
--	     sex  varchar2(2),
--	     birth  date,
--	     passwd varchar2(8),
--	     dno number(2)
--	  );
--
--	  create table course(
--	     cno varchar2(8),
--	     cname  varchar2(20),
--	     credit  number(1),
--	     ctime  number(2),
--	     quota  number(3)
--	  );
--
--	  create table sc(
--	     sno number(6),
--	     cno varchar2(8),
--	     grade number(3)
--	  );

--
--insert into dep values(10,'计算机学院',9469,'62785234');
--insert into dep values(20,'自动化学院',9581,'62775234');
--insert into dep values(30,'无线电学院',9791,'62778932');
--insert into dep values(40,'信息管理学院',9611,'62785520');
--insert into dep values(50,'微纳电子学院',2031,'62797686');





--select * from  teacher；
--alter table dep add(constraint pk_deptno primary key(dno));
--alter table dep add(constraint dno_number_check check(dno>=10 and dno<=50));
--alter table dep modify(tel default 62795032);
--alter table student add(constraint pk_sno primary key(sno));
--alter table student add(constraint sex_check check(sex='男' or sex='女'));
--alter table student modify(birth default sysdate);
--alter table course add(constraint pk_cno primary key(cno));
--alter table sc add(constraint pk_key primary key(cno,sno));
--alter table teacher add(constraint pk_tno primary key(tno));
--alter table sc add(foreign key(cno) references course(cno));
--alter table sc add(foreign key(sno) references student(sno));
--alter table student add(foreign key(dno) references dep(dno));
--alter table teacher add(foreign key(deptno) references dep(dno));




--
--delete from  teacher
select * from teacher
insert into teacher values(9468,'CHARLES','PROFESSOR',to_date('17-12-2017','dd-MM-yyyy'),8000,1000,null,10);
insert into teacher values(9469,'SMITH','PROFESSOR',to_date('17-12-2017','dd-MM-yyyy'),5000,1000,9468,10);
insert into teacher values(9470,'ALLEN','ASSOCIATE PROFESSOR',to_date('20-2-2016','dd-MM-yyyy'),4200,500,9469,10);
insert into teacher values(9471,'WARD','LECTURER',to_date('22-2-2017','dd-MM-yyyy'),3000,300,9469,10);
insert into teacher values(9581,'JONES','PROFESSOR',to_date('2-4-2016','dd-MM-yyyy'),6500,1000,9468,20);
insert into teacher values(9582,'MARTIN','ASSOCIATE PROFESSOR',to_date('28-9-2018','dd-MM-yyyy'),4000,800,9581,20);
insert into teacher values(9583,'BLAKE','LECTURER',to_date('1-5-2019','dd-MM-yyyy'),3000,300,9581,20);
insert into teacher values(9791,'CLAKE','PROFESSOR',to_date('9-6-2016','dd-MM-yyyy'),5500,null,9468,30);
insert into teacher values(9792,'SCOTT','ASSOCIATE PROFESSOR',to_date('09-12-17','dd-MM-yyyy'),4500,null,9791,30);
insert into teacher values(9793,'BAGGY','LECTURER', to_date('17-11-2017', 'dd-MM-yyyy'),3000,null,9791,30);






insert into teacher values(9611,'TURNER','PROFESSOR','8-Sep-2018',6000,1000,9468,40);
insert into teacher values(9612,'ADAMS','ASSOCIATE PROFESSOR','12-Jan-17',4800,800,9611,40);
insert into teacher values(9613,'JAMES','LECTURER','3-Dec-19',2800,200,9611,40);
insert into teacher values(2031,'FORD','PROFESSOR','3-Dec-18',5500,null,9468,50);
insert into teacher values(2032,'MILLER','ASSOCIATE PROFESSOR','23-Jan-2018',4300,null,2031,50);
insert into teacher values(2033,'MIGEAL','LECTURER','23-Jan-2019',2900,null,2031,50);
insert into teacher values(2034,'PEGGY','LECTURER','23-Jan-2020',2800,null,2031,50);