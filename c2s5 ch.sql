create database Wat_A_Pizza_

use Wat_A_Pizza_

--task 1
create table pizzamenu(
pizzanamem varchar (20) not null,
topping varchar (20) not null,
size varchar(20) not null,
pizzaid int primary key,
price int not null
)
select *  from pizzamenu
--task 2
insert pizzamenu value('Double_Cheese','Extra_cheese', 'medium', 101,100);
insert pizzamenu value('Corn_Pizza','Extra_core', 'large', 102,150);
insert pizzamenu value(' Farmhouse_Pizza','Mushroom', 'small', 103,200);
insert pizzamenu value('Paneer_Pizza','Extra_paneer', 'medium', 104,250);
insert pizzamenu value('Non_veg_pizza','Onion', 'large', 105,300);

--task 3
create table customer(
cname varchar (20) not null,
custid int primary key,
phoneno int,
address varchar(20) not null
)

insert customer value('Jay',201,88888,'Indore');
insert customer value('Raj',202,77777,'Pune');
insert customer value('Shiv',203,99999,'Bhopal');
insert customer value('Dev',204,55555,'goa');
insert customer value('Ram',205,66666,'Mumbai');
select * from customer

--task 4
create table order_recived(
orderid int primary key,
custid int, foreign key(custid) references customer(custid),
amount int,
orderdate datetime not null,
pizzaid int, foreign key(pizzaid) references pizzamenu(pizzaid),
Home_d varchar(20)
)

insert order_recived value(1001,201,100,"2022-06-01",101,'yas')
insert order_recived value(1002,202,150,"2022-06-02",102,'NO')
insert order_recived value(1003,203,200,"2022-06-03",103,'yas')
insert order_recived value(1004,204,250,"2022-06-04",104,'NO')
insert order_recived value(1005,205,300,"2022-06-05",105,'yas')

--task 5
create table crust(
fname varchar (20),
crustid int,
rate int
)
insert crust value ('stuffed',50,100);
insert crust value ('cracker',60,200);
insert crust value ('Thick',40,300);
insert crust value ('thin',30,250);
insert crust value ('chees',70,400);
select * from crust;

--task 6
'I will done in task 1 pizzamenu'

--task 7
'list all the iteam pizza menu outlet '
select * from pizzamenu


-- task 8
'list all the cusmtmer who had ordered large piza '
select C.customer,P.size from order_recived o
join customer C on O.custid=C.custid
join pizzamenu P on O.pizzaid=P.pizzaid
where P.size='large'

-- task 9 
'Find the most prefeerd topping'
select count(P.Topping) as most_prefer_topping,P.topping from order_recived o
join pizzamenu P on O.pizzaid=P.pizzaid
group by P.topping having count(P.topping) order by count(P.topping) 

--task 10
'find the customer who had highest bill amount '
select c.cname,o.amount from  order_recived o join customer c
on o.custid = c.custid
order by o.amount desc limit 1

--task 11
'list the number of home dilivery '
select Home_d,count(Home_d) as 'Total delivery' from orders where Home_id = 'yas'

--task 12
'give 10% discount bill of who had large pizza order update bill accordingly '
alter table order_recived add column  Discounted_bill int
update order_recived set Discounted_bill = amount(amount * 10/100) where pizzaid in (select pizzaid from wat_a_pizza_.pizzamenu where size = 'large')