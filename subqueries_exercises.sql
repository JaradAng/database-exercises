

-- Q1
select hire_date
from employees
where emp_no = '101010';
select *
from employees
join dept_emp using (emp_no)
where to_date > now() and hire_date = (select hire_date
from employees
where emp_no = '101010')
;
-- 55 empoloyees hired on the same day


-- Q2
select first_name
from employees
where first_name = 'aamod';

select distinct title -- first_name, last_name
from titles
join employees using (emp_no)
join dept_emp as de using (emp_no)
where de.to_date > now() and first_name in (select first_name
from employees
where first_name = 'aamod');
-- order by last_name;
-- returned 248 rows
-- originally had the names as well as titles updated the code to just have the distinct titles
select *
from dept_emp
limit 5;


-- Q3
select emp_no
from employees as e
join dept_emp as de using (emp_no)
where de.to_date < curdate();

select count(*) 
 from employees as e where e.emp_no in (select emp_no
from employees as e
join dept_emp as de using (emp_no)
where de.to_date < curdate());
-- 85108
-- this pulled duplicate results

select * from employees
where emp_no not in(select emp_no from dept_emp where to_date > now());
-- redid the code and came up with less results from the first time

-- Q4
select *
from employees
join dept_manager using (emp_no)
where to_date > now()
and gender = 'F';
-- Legleitner, Sigstam, DasSarma, Kambil

SELECT 
    emp_no
FROM
    dept_manager
WHERE
    to_date > NOW();

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    gender = 'F'
        AND emp_no IN (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            to_date > NOW());
-- same as previous just wanted to try a different way

-- Q5

select avg(salary) 
from salaries;

select first_name, last_name
from employees
join salaries using (emp_no)
where to_date > now() and salary > (select avg(salary)
from salaries);
-- 154543

-- q6
select max(salary) - (std(salary)) 
from salaries
where to_date > now();

-- is the std of salaries 16905

select count(*)
from salaries 
where salary >= (select max(salary) - (std(salary)) 
from salaries
where to_date > now())
and to_date > now();
-- 83 have salary within 1 std of max

select count(*)
from salaries
where to_date > now();

select (select count(*)
from salaries 
where salary >= (select max(salary) - (std(salary)) 
from salaries
where to_date > now())
and to_date > now()) / (select count(*)
from salaries
where to_date > now()) * 100
from salaries;
-- % = 0.0346% of employees within in std of top

-- BONUS
 -- --------------------
 
 -- Q1
select emp_no 
from dept_manager
where to_date > now();

select emp_no
from employees
where gender = 'F' and emp_no in (select emp_no 
from dept_manager
where to_date > now());

select dept_no
from dept_emp
where emp_no in (select emp_no
from employees
where gender = 'F' and emp_no in (select emp_no 
from dept_manager
where to_date > now()));
-- dept no = d002, d003, d005, d008

-- Q2
select max(salary)
from salaries;

select emp_no
from salaries
where salary = (select max(salary)
from salaries);

select first_name, last_name
from employees
where emp_no = (select emp_no
from salaries
where salary = (select max(salary)
from salaries));
-- Tokuyasu Pesch


-- Q3
select max(salary)
from salaries;

select emp_no
from salaries
where salary = (select max(salary)
from salaries);

select dept_no
from dept_emp
where emp_no = (select emp_no
from salaries
where salary = (select max(salary)
from salaries));

select dept_name
from departments
where dept_no = (select dept_no
from dept_emp
where emp_no = (select emp_no
from salaries
where salary = (select max(salary)
from salaries)));

-- Sales