Rename table:

Alter table old_name rename to new_name
Alter table student rename to studentInfo

Adding Column:

Alter table table_name add column_name datatype
alter table  studentInfo add dept varchar(3)

Drop Column:

Alter table table_name drop column column_name 
Alter table studentInfo drop column dept

Modify Column:

Alter table table_name modify old_column_name new_datatype
alter table  studentInfo modify name varchar(22)
Rename Column:

Alter table table_name rename column old_name to new_name
Alter table studentInfo rename column dept to deptno

***

update studentInfo set cgpa=3 where id=1
delete from studentInfo where id=12
truncate table studentInfo
drop table studentInfo