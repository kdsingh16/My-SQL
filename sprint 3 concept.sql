create database kd_company
create table department (
deptNo int primary key,
deptName varchar (100) unique not null ,
manager varchar(100) not null
)
insert department value (1, 'Sales' , 'John' )
insert department value (2, 'it' , 'Jimmy' )
insert department value (3, 'sql' , 'raj' )
'Task no 3'
update department set deptName = 'sales and finance ' where deptno 1
'task no 4 '
alter table department add designation varchar (20)

set SQL_SAFE_UPDATES = 0
update department set designation = 'jr_asist' 
select * from department
'task no 5'
delete from department where deptno = 1
'view table'
select * from department
