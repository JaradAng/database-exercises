--  1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
use employees;

select emp_no, dept_no, from_date, to_date,
if (to_date > curdate(), 'Yes', 'No') as "Is_Current_employee"
from dept_emp;

-- 2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

select last_name,
case when substr(last_name, 1, 1) < 'H' then "A_thru_H"
when substr(last_name, 1, 1) < 'Q' then "I_thru_Q"
else "R_thru_Z"
end as alphabet_names
from employees;

-- 3. How many employees (current or previous) were born in each decade?

select birth_date
from employees
order by birth_date desc;
-- order by both asc and desc to determine how many decades to make a case for

select -- concat(first_name, " ", last_name) as "Employee Name",
case when birth_date like '195%' then "Born in 50's"
when birth_date like '196%' then "Born in 60's"
else "Record not found"
end as decade, count(*)
from employees
group by decade;
-- tired to use the count function around the entire case condition but it didn't work and I tried to do the count funciton before the case but didn't work
-- finally just put count after the case and it worked giving me count of 182886 born in 50's and 117138 borin in 60's

-- 4. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
select dept_name from departments;
-- this brought up the names so i get the dept names right 
SELECT
    -- dept_name,
    CASE
        WHEN dept_name IN ('Marketing', 'Sales') THEN 'Sales and Marketing'
        WHEN dept_name LIKE '%research%' OR dept_name LIKE '%development%' THEN 'R&D'
        WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod and QM'
        WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance and HR'
        ELSE 'Customer Service'
    END AS department_categories, avg(salary) as "Salary Average"
FROM departments
join dept_emp using (dept_no)
join salaries using (emp_no)
where salaries.to_date > now() and dept_emp.to_date > now()
group by department_categories;

-- disregard all below this becuase I thought creating a table would help me but it just made it more confusing and I went back to try and join the tables needed


-- create temporary table kalpana_1812.avgsalary (SELECT
--     dept_name,
--     CASE
--         WHEN dept_name IN ('Marketing', 'Sales') THEN 'Sales and Marketing'
--         WHEN dept_name LIKE '%research%' OR dept_name LIKE '%development%' THEN 'R&D'
--         WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod and QM'
--         WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance and HR'
--         ELSE 'Customer Service'
--     END AS department_categories -- avg(salary) as "Salary Average"
-- FROM departments);

-- alter table kalpana_1812.avgsalary add AvgSalary int;
-- update kalpana_1812.avgsalary set AvgSalary = (select avg(salary) from salaries);

-- select * from kalpana_1812.avgsalary;


-- select avg(salary), dept_name
-- from salaries
-- join dept_emp using (emp_no)
-- join departments using (dept_no)
-- group by dept_name;

select dept_name, avg(salary)
from salaries
join dept_emp using (emp_no)
join departments using (dept_no)
where salaries.to_date > now() and dept_emp.to_date > now()
group by dept_name;