create database car_sales_
use car_sales_
create table sales_person(
Sales_id int primary key,
fname varchar (20) not null,
city varchar (20) not null,
commission_rate int,
Address varchar (20) not null
)

insert sales_person value(1002,'peter','london',12 , 'sectar 1');
insert sales_person value(1002,'peter','london', 12,'sectar 1');
insert sales_person value(1003,'rifkin','barcelona', 15, 'sectar 2');
insert sales_person value(1004,'judith','london', 11,'sectar 3');
insert sales_person value(1004,'judith','london', 11,'sectar 3');
insert sales_person value(1008,'john','london', 0,'sectar 4');
insert sales_person value(1009,'charles','florida','null','sectar 5');
insert sales_person value(1009,'charles','florida','null','sectar 5');

create table customer(
customer_id int primary key not null,
name_ varchar (20) not null,
last_name varchar(20) not null,
city varchar (20) not null,
rating int not null,
sales_id int not null,
Address varchar (20) not null
)


insert customer value(2001,'Hoffman','Anny','London',100,1001, 'sectar 1');
insert customer value(2002,'Glovanni','jenny','romee',200,1003, 'sectar 2');
insert customer value(2003,'liu','williams','San jose',100,1002, 'sectar 3');
insert customer value(2004,'grass','harry','berlin',300,1002, 'sectar 4');
insert customer value(2005,'clemens','john','London',100,1001, 'sectar 5');
insert customer value(2006,'cisneros','fanny','san jose',200,1007, 'sectar 6');
insert customer value(2007,'pereira','jonathan','rome',300,1004, 'sectar 7');

create table order_details(
order_id int primary key not null,
amount int not null,
order_date date not null,
customer_id int not null
)

insert order_details value(3001,123,'2020-02-01',2008);
insert order_details value(3003,187,'2020-10-02',2001);
insert order_details value(3002,100,'2020-07-30',2007);
insert order_details value(3005,201,'2011-10-09',2003);
insert order_details value(3009,123,'2012-10-10',2008);
insert order_details value(3007,167,'2020-04-10',2002);
insert order_details value(3008,189,'2020-06-03',2002);
insert order_details value(3010,200,'2012-02-23',2006);
insert order_details value(3011,100,'2000-09-18',2004);

--task:- 1  
'default_city show on their'
select * from customer where IFNULL(city, default(city)) = default(city);

--task:- 2 
'Find the salesperson whose name start p & L'
select * from sales_person where fname like 'p__l%'

--task :-3
'list all the customer from san jose londan salesperson table'
select * from sales_person
where city = 'london' or 'San jose'

--task:- 4
'select all the customer whose name start either with latter a or g'
select * from customer where name_ like 'A%'
select* from customer where name_ like'G%'

--task :- 5
'list the highest rating given from each city'
select max(commission_rate) from sales_person where city='london'

--task:- 6
'selas person who are located in either barcelon or londan '
select * from sales_person where city = 'london' or city='barcelona'

--task:-7
'find all order made betwwen oct 3,2020 and dec4,2020'
select * from order_details where order_detail between '2020-10-03' and '2020-12-04'

--task :- 8
'find the sum all purches from the order table'
select sum(amount) from order_details

--task 9
'count the number of nonnull rating fields in the custmers table '
select count(rating) from customer

--task 10
'list the full names of all the customers in the titile case example hoffman anny'
select rating, count(rating) from customer group by rating

--task 11
'list all the customersnwho have rating between 200 and 300'
select * from customer where rating between '200' and '300'

--task 12
'sort the customers by their first names.'
select * from customer order by name_

--task 13
'sort the amount of all the order in descending order'
select amount from order_details order by amount desc

--task 14
'find the avg amount of all the order'
select avg(amount) as 'average amount ' from order_details

--task 15
'list the number of customer from each city'
select count(name_), city from customer group by city

--task 16
'list the number of customer from each city sorted in the reserve alphabatical order'
select * from customer group by city order by name_ desc

--task 17
'find the order done in the month of april'
select * from order_details where month(order_date)=4

--task 18
'list the top five order based on the amount '
select * from order_details order by amount desc limit 5

--task 19
'find the sales person who will resived highest commision'
select max(commission_rate) , fname from sales_person

--task 20
'list the three salesperson who have lowest commission rates'
select * from sales_person order by (commission_rate) limit 3

