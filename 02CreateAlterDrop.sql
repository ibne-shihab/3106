use master
create database Sayeeda_Khan

use Sayeeda_Khan

create table student(
	ID numeric(8,0),
	stu_name varchar(20),
	dept_name varchar(20),
	total_credit numeric(7,2),
	sesion varchar(20),
	reg_num numeric(8,0),
	primary key(ID))

insert into student
values('200101','Panda','CSE','160','2019-2020','1065319'),
		('200210','Penguin','EEE','155','2017-2018','1056779'),
		('200618','Master Shifu','ICE','165','2019-2020','1065383'),
		('201234','Iron Man','EECE','155','2017-2018','1056779'),
		('203456','Bat Man','Math','155','2017-2018','1056779'),
		('205678','Spider Man','Bangla','155','2017-2018','1056779'),
		('209012','Thanos','English','155','2017-2018','1056779'),
		('123456','Groot','Physics','155','2017-2018','1056779')

select * from student

alter table student drop column reg_num

select * from student

select name from sysobjects where xtype='u'

drop table classroom

select name from sysobjects where xtype='u'