SCOTT�û���dept���emp������ (2014-09-05 11:57:00)ת�ب�
��ǩ�� ����	���ࣺ SCOTT�û���dept��emp��
create table DEPT
(
DEPTNO number(2) not null,
DNAME varchar(14),
LOC varchar(13)
)
;
alter table DEPT
add constraint PK_DEPT primary key (DEPTNO);

create table EMP
(
EMPNO number(4) not null,
ENAME varchar(10),
JOB varchar(9),
MGR number(4),
HIREDATE date,
SAL number(7 ),
COMM number(7 ),
DEPTNO number(2)
)
;
alter table EMP
add constraint PK_EMP primary key (EMPNO);
alter table EMP
add constraint FK_DEPTNO foreign key (DEPTNO)
references DEPT (DEPTNO);

insert into DEPT (DEPTNO, DNAME, LOC)
values (10, 'ACCOUNTING', 'NEW YORK');
insert into DEPT (DEPTNO, DNAME, LOC)
values (20, 'RESEARCH', 'DALLAS');
insert into DEPT (DEPTNO, DNAME, LOC)
values (30, 'SALES', 'CHICAGO');
insert into DEPT (DEPTNO, DNAME, LOC)
values (40, 'OPERATIONS', 'BOSTON');
commit;

insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7369, 'SMITH', 'CLERK', 7902, to_date('1980-12-17', 'YYYY-MM-DD'), 800, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7499, 'ALLEN', 'SALESMAN', 7698, to_date('1981-02-20', 'YYYY-MM-DD'), 1600, 300, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7521, 'WARD', 'SALESMAN', 7698, to_date('1981-02-22', 'YYYY-MM-DD'), 1250, 500, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7566, 'JONES', 'MANAGER', 7839, to_date('1981-04-02', 'YYYY-MM-DD'), 2975, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7654, 'MARTIN', 'SALESMAN', 7698, to_date('1981-09-28', 'YYYY-MM-DD'), 1250, 1400, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7698, 'BLAKE', 'MANAGER', 7839, to_date('1981-05-01', 'YYYY-MM-DD'), 2850, null, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7782, 'CLARK', 'MANAGER', 7839, to_date('1981-06-09', 'YYYY-MM-DD'), 2450, null, 10);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7788, 'SCOTT', 'ANALYST', 7566, to_date('1987-04-19', 'YYYY-MM-DD'), 3000, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7839, 'KING', 'PRESIDENT', null, to_date('1981-11-17', 'YYYY-MM-DD'), 5000, null, 10);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7844, 'TURNER', 'SALESMAN', 7698, to_date('1981-09-08', 'YYYY-MM-DD'), 1500, 0, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7876, 'ADAMS', 'CLERK', 7788, to_date('1987-05-23', 'YYYY-MM-DD'), 1100, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7900, 'JAMES', 'CLERK', 7698, to_date('1981-12-03', 'YYYY-MM-DD'), 950, null, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7902, 'FORD', 'ANALYST', 7566,to_date('1981-12-02', 'YYYY-MM-DD'), 3000, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7934, 'MILLER', 'CLERK', 7782, to_date('1982-01-23', 'YYYY-MM-DD'), 1300, null, 10);
commit;
