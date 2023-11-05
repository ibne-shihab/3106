use Sayeeda_Khan

create table classroom(
	building varchar(20),
	room_number varchar(10),
	capacity numeric(5,0),
	primary key(building,room_number))

select * from classroom

insert into classroom
			values('Engineering','301','25'),
				   ('Engineering','302','50'),
				   ('Engineering','303','45'),
				   ('Engineering','304','25')

select * from classroom

update classroom
set capacity= 40
where room_number ='304'

select * from classroom

delete from classroom
where room_number=301

select * from classroom