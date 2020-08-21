Primary Key:
create table deptk(deptid number(3) primary key,dname varchar2(12));

Foreign Key:
create table student(id number(11) constraint pkk primary key,name varchar2(32),cgpa float,deptid number(3),constraint fkk foreign key(deptid) references deptk(deptid));

insert into student(id,name,cgpa) values(15,'ABC',2.8);
insert into deptk values(3,'BBA');

select * from deptk;
select * from student;
drop table student;

Not NULL:
create table student(id number(3) constraint nkk not null,dname varchar(12))

UNIQUE:
create table student(id number(3) constraint ukk unique,dname varchar(12))

Default:
create table student(id number(3) default(0),dname varchar(12))

Check:
coulmn level:
create table student(id number(11) constraint pkk primary key,name varchar2(32),cgpa float constraint ckk check(cgpa between 0 and 4),deptid number(3),constraint fkk foreign key(deptid) references deptk(deptid));
table level:
create table teacher(id number(3) constraint tkk primary key,tname varchar2(32),sal number(20),deptno number(3),constraint fkkk foreign key(deptno) references deptf(deptno),constraint ckkk check(id in(1,2,3) and tname like 'A%'))
Table level:
create table student(id number(11) constraint pkk primary key,name varchar2(32),cgpa float,deptid number(3),constraint fkk foreign key(deptid) references deptk(deptid), constraint ckk check(cgpa between 0 and 4 and name like 'A%'));
Alter Constraints:
Alter table student add constraint pkk primary key(id);
Alter table student add constraint fkk foreign key(deptid) references dept(deptno);
Alter table student add constraint ukk unique(id);
Alter table student modify id default(0);
Alter table student modify id not null;
Alter table student add constraint ckk check(id in(1,2,3));
  
