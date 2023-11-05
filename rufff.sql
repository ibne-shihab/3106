use SK
create table instructor2(
	 ID varchar(20),
	 Ins_name varchar(50),
	 dept_name varchar(30),
	 salary numeric(9,0),
	 primary key(ID))

insert into instructor2
	values('ICE01','Dr. Pallab Kanti Poddar','ICE','100000'),
	      ('ICE02','Dr. Md. Omar Faruk','ICE','100000'),
		  ('ICE03','Md. Anwar Hossain','ICE','100000'),
		  ('ICE04','Iffat Ara','ICE','100000'),
		  ('ICE05','Sohag Sarker','ICE','100000'),
		  ('ICE06','Md. Sarwar Hosain','ICE','100000'),
		  ('ICE07','Abul Fazal Mohammad Zainul Abadin','ICE','100000'),
		  ('ICE08','Dr. Md. Imran Hossain','ICE','100000'),
		  ('ICE09','Taskin Noor Turna','ICE','90000'),
		  ('ICE10','Md. Tofail Ahmed','ICE','90000'),
		  ('ICE11','Tarun Debnath','ICE','90000'),
		  ('ICE12','Muntasir Ahmed','ICE','85000'),
		  ('CSE01','Nitun Kumar Podder','CSE','70000'),
		  ('EEE01','Md. Shamim Hossain','EEE','70000'),
		  ('EEE02','Tonmoy Ghosh','EEE','70000'),
		  ('Stat01','Mira Khatun','STAT','70000')

select * from instructor2
select dept_name,count(ID) as Department_Teachers
from instructor2
group by dept_name

select min(Ins_name) as TeacherMinname,dept_name
from instructor2
group by  dept_name

select max(Ins_name) as TeacherMaxname,dept_name
from instructor2
group by  dept_name

select avg(salary) as DepartmentAVG_salary,dept_name
from instructor2
group by  dept_name
