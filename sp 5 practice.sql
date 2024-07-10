create database car_sales_1
use car_sales_1
create table sales_person_(
Sales_id int primary key,
fname varchar (20) not null,
city varchar (20) not null,
commission_rate int,
Address varchar (20) not null
)

insert sales_person_ value(1002,'peter','london',12 , 'sectar 1');
insert sales_person_ value(1002,'peter','london', 12,'sectar 1');
insert sales_person_ value(1003,'rifkin','barcelona', 15, 'sectar 2');
insert sales_person_ value(1004,'judith','london', 11,'sectar 3');
insert sales_person_ value(1004,'judith','london', 11,'sectar 3');
insert sales_person_ value(1008,'john','london', 0,'sectar 4');
insert sales_person_ value(1009,'charles','florida','null','sectar 5');
insert sales_person_ value(1009,'charles','florida','null','sectar 5');

create table customer_(
customer_id int primary key not null,
name_ varchar (20) not null,
last_name varchar(20) not null,
city varchar (20) not null,
rating int not null,
sales_id int, foreign key (sales_id) references sales_person(sales_id),
Address varchar (20) not null
)


insert customer_ value(2001,'Hoffman','Anny','London',100,1001, 'sectar 1');
insert customer_ value(2002,'Glovanni','jenny','romee',200,1003, 'sectar 2');
insert customer_ value(2003,'liu','williams','San jose',100,1002, 'sectar 3');
insert customer_ value(2004,'grass','harry','berlin',300,1002, 'sectar 4');
insert customer_ value(2005,'clemens','john','London',100,1001, 'sectar 5');
insert customer_ value(2006,'cisneros','fanny','san jose',200,1007, 'sectar 6');
insert customer_ value(2007,'pereira','jonathan','rome',300,1004, 'sectar 7');

create table order_details_(
order_id int primary key not null,
amount int not null,
order_date date not null,
customer_id int 
 )

insert order_details_ value(3001,123,'2020-02-01',2008);
insert order_details_ value(3003,187,'2020-10-02',2001);
insert order_details_ value(3002,100,'2020-07-30',2007);
insert order_details_ value(3005,201,'2011-10-09',2003);
insert order_details_ value(3009,123,'2012-10-10',2008);
insert order_details_ value(3007,167,'2020-04-10',2002);
insert order_details_ value(3008,189,'2020-06-03',2002);
insert order_details_ value(3010,200,'2012-02-23',2006);
insert order_details_ value(3011,100,'2000-09-18',2004);



--task 1
select  s.fname as 'sales_person_ '
from sales_name s join customers_ c
on c.sales_id = s.sales_id
join order_details_ o
on c.customer_Id = o.customer_id


--task 2

select c.name_,s.fname from customer_ c left join sales_person_ s on c.sales_id=s.sales_id;

--task 3
select sales_id, fname from sales_person_ s where 1 < (select count(*) from customer_ where sales_id=s.sales_id)


--task 4
select count(order_id) as order_details_ ,sales_id, sales_person_.fname from order_details_
join customer_ using (sales_id) join sales_person_ using (sales_id) group by sales_id

--task 5
select S.fname,o.order_id as all_order,S.Sales_id
from sales_person_ s join customer_ c
on S.Sales_id=c.Sales_id
join order_details o
on c.customer_id=o.customer_id
where s.fname= 'judith'

--task 6
select fname,city from sales_person_ where city != any (select city from customer_);

--task 7
select fname,city from sales_person_ where city = all (select city from customer_);

--task 8
select  o.order_id
from order_details_ o join customer_ c
on o.customer_id = c.customer_id
join sales_person_ s
on c.sales_id +s.sales_id
where c.city <> s.city

--task 9
select commission_rate ,fname as sales_person_,city
from sales_person_
where city = 'london'

--task 10
create view  sales_person_ as
select * from  sales_person_ s
where s.commission_rate > 12


--task 11
select s.fname,s.sales_id
from sales_person_ s
join car_sales_1.customer_ c on s.sales_id = c.sales_id
where s.city != c.city
group by s.fname

--task 12
select s.sales_id, s.fname from sales_person_ s inner join customer_ c on s.sales_id = c.sales_id
inner join order_details_ o on c.customer_id = o.customer_id where o.order_date not between '2020-03-10' and '2020-05-10';

--task 13
select s.fname,count(o.order_id) as order_details_ from sales_person_ s
join customer_ c on c.sales_id=s.sales_id
join order_details_ o on c.customer_id-o.customer_id
group by s.fname having count(o.order_id) > 0

--task 14

select o.order_date, s.fname, o.amount from sales_person_ s join customer_ c on c.sales_id = s.sales_id join order_details_ o on c.customer_id  = o.customer_id having max(amount)


--task 15

create view name_ as 
select upper('fname'),name_,last_name
from customer_ ;