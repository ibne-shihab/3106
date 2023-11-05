use master
create database storetable
use storetable

create table Customer(
 cust_id char(5) primary key check(cust_id like('[C][0-9][0-9][0-9][0-9]')),
 cust_fname char(15)not null,
 cust_lname varchar(15),
 cust_address text)
 select * from Customer

 insert into Customer
 values('C0004','Sayeeda','Khan','Kushtia')
 
 create table ITEMS(
  item_id char(5) primary key check(item_id like ('[P][0-9][0-9][0-9][0-9]')),
  item_name char(12),
  item_catagory char(15),
  item_price float(12) check (item_price>=0),
  item_40h int check(item_40h>=0),
  item_last_sold datetime default getdate())

  select * from ITEMS
  insert into ITEMS
  values('P0001','Singer','washing machine','1234','26','05-10-2023'),
  ('P0002','MacBook','laptop','1000','4','05-11-2023'),
  ('P0003','iphone','phone','500','10','01-1-2023'),
  ('P0004','ROG','laptop','1500','12','05-4-2023'),
  ('P0005','Gree','AC','2500','1','5-09-2023'),
  ('P0006','BMG','Car','30000','30','05-5-2023'),
  ('P0007','Royel ','Bike','20000','33','05-12-2023')

  create table Transac(
  trans_id char(8) check(trans_id like ('[T] [0-9] [0-9] [0-9] [0-9] [0-9] [0-9] [0-9]')),
  item_id char(5) foreign key references ITEMS(item_id),
  cust_id char (5) foreign key references Customer(cust_id),
  trans_type char(1),
  trans_quantity int check (trans_quantity>0),
  trans_date datetime default getdate())

  select * from Transac

 /* create trigger test on ITEMS for INSERT
  as
  begin
	  declare @item_id char(5),@amount char (12),@trans_type char(1)
	  select @item_id=item_id,@amount=trans_quantity,
	  @trans_type=trans_type from inserted
	  if(@trans_type='s')
		  update ITEMS set item_40h=item_40h-@amount
		  where item_id=@item_id
	  else
		  update ITEMS set item_40h=item_40h+@amount
		  where item_id=@item_id
		  end
  */

		  -- Create the trigger
CREATE TRIGGER test ON ITEMS
FOR INSERT
AS
BEGIN
  DECLARE @item_id CHAR(5), @amount FLOAT, @trans_type CHAR(1)

  SELECT @item_id = item_id, @amount = item_price, @trans_type = 's' -- Assuming this is what you intended

  IF (@trans_type = 's')
    UPDATE ITEMS
    SET item_40h = item_40h - @amount
    WHERE item_id = @item_id
  ELSE
    UPDATE ITEMS
    SET item_40h = item_40h + @amount
    WHERE item_id = @item_id
END;

  insert into Transac 
  values('T000001','P0003','C0001','5','02-11-2023')
  
  select * from Transac
  select * from ITEMS
