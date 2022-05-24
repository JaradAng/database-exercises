select first_name, last_name, dept_name
from employees
join dept_emp de using (emp_no)
join departments d using (dept_no)
where de.to_date > now();

create temporary table kalpana_1812.employees_with_departments (select first_name, last_name, dept_name
from employees
join dept_emp de using (emp_no)
join departments d using (dept_no)
where de.to_date > now());

select * from kalpana_1812.employees_with_departments;

alter table kalpana_1812.employees_with_departments add full_name varchar(100);
update kalpana_1812.employees_with_departments set full_name = concat(first_name, " ", last_name);

alter table kalpana_1812.employees_with_departments drop column first_name;
alter table kalpana_1812.employees_with_departments drop column last_name;

-- could have done it by joining and selecting the concat fn to the table


-- Q2

use sakila;
select amount
from payment;

create temporary table kalpana_1812.payment_table (select amount
from payment);

alter table kalpana_1812.payment_table modify amount int;
update kalpana_1812.payment_table set amount = (amount * 100);
 
 select * from kalpana_1812.payment_table;
 
 alter table kalpana_1812.payment_table drop column amount;

-- Q3

use employees;
select distinct dept_name, avg(salary) -- stddev(salary)
from employees as e
join dept_emp as de using(emp_no)
join salaries s using(emp_no)
join departments d using (dept_no)
join titles t using (emp_no)
where de.to_date > now()
and s.to_date > now()
group by dept_name;


drop table if exists kalpana_1812.ztable;
create temporary table kalpana_1812.ztable (select distinct dept_name, avg(salary) as 'AVG'
from employees as e
join dept_emp as de using(emp_no)
join salaries s using(emp_no)
join departments d using (dept_no)
join titles t using (emp_no)
where de.to_date > now()
and s.to_date > now()
group by dept_name);

select * from kalpana_1812.ztable;
use employees;
alter table kalpana_1812.ztable add comp_avg int;
alter table kalpana_1812.ztable add std_dev int;
alter table kalpana_1812.ztable add zscore float;
update kalpana_1812.ztable set comp_avg = (select avg(salary) from salaries);
update kalpana_1812.ztable set std_dev = (select stddev(salary) from salaries);
update kalpana_1812.ztable set zscore = ((AVG - comp_avg) / std_dev);

select * from kalpana_1812.ztable order by zscore desc;

--- BONUS 
use employees;
select distinct dept_name, avg(salary) -- stddev(salary)
from employees as e
join dept_emp as de using(emp_no)
join salaries s using(emp_no)
join departments d using (dept_no)
join titles t using (emp_no)
-- where de.to_date > now()
-- and s.to_date > now()
group by dept_name;


-- drop table if exists kalpana_1812.histable;
create temporary table kalpana_1812.ztable (select distinct dept_name, avg(salary) as 'AVG'
from employees as e
join dept_emp as de using(emp_no)
join salaries s using(emp_no)
join departments d using (dept_no)
join titles t using (emp_no)
where de.to_date > now()
and s.to_date > now()