use pubs
SELECT NAME FROM SYSOBJECTS WHERE XTYPE='U'

select * from authors

select au_lname,phone,address,city
from authors
where state='CA' and city='Oakland'



select * from authors
where state='CA' or state='KS'
---Solved Task 1---


select * from titles
select title,type,ytd_sales
from titles
where ytd_sales<10000
order by ytd_sales asc

------Solved Task 2---
select * from titles
select max(price) as MaxPrice,sum(ytd_sales) as Yearly_Total,type
from titles
group by type

select * from titleauthor

select royaltyper,au_lname,au_fname
from authors
inner join titleauthor
on titleauthor.au_id=authors.au_id
order by royaltyper desc

select au_lname,au_fname,authors.city as AuthorCIty,pub_name,publishers.city as PubCity
from authors
inner join publishers
on authors.city<>publishers.city

