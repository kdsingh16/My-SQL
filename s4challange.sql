use hr

show tables
select * from employees
--task 1
select count(employee_id) from employees
--task 2
select department_name, count(employee_id) from emp_details_view group by department_name
--task 3
select * from employees  where(salary)> '$6000' limit 4
--task 4
select * from employees where(salary)> '$20000' limit 2
--task 5
select count(employee_id) from emp_details_view where salary>6000 and department_name= 'IT'
select * from departments

--task 6
alter table employees add column Annual_CTC_ float as (salary*12)
select* from employees

--task 7
alter table employees add  Increment int;
update employees set Increment = 1.2* annual_ctc where salary between 2000 and 15000
update employees set Increment = 1.1* annual_ctc where salary between 16000 and 20000
update employees set Increment = 1.05* annual_ctc where salary between 21000 and 25000

select * from employees


--task 8
select * from employees where commission_pct>0;

--task 9
select employee_id, concat(first_name,last_name), commission_pct from employees where commission_pct is null;

--task 10
select  first_name,last_name,email,phone_number,employee_id from employees where commission_pct is not null

--task 11
select first_name,department_name,max(salary) from emp_details_view group by department_name
select * from employees

--task 12
select distinct department_id,CTC from employees order by (CTC) desc limit 3 -- executive department
select * from emp_details_view

--task 13
select * from emp_details_view where job_title like '%clerk%'

--task 14
select count(employee_id),avg(salary) from emp_details_view where job_title like '%clerk%'

--task 15
select count(employee_id), department_name from emp_details_view group by (department_name)

--task 16
select department_id, avg(salary) as average_salary from employees group by department_id

--task 17
select department_id, count(*) from employees where salary between 7000 and 10000 group by department_id

--task 18
Select first_name,last_name, hire_date,(datediff(curdate(),hire_date)/365) as 'year_of_exp' from employees
