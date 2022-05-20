use employees;

select *
from titles;
-- Q2

select distinct title
from titles; 
-- There are 7 distinct titles

-- Q3
select last_name, count(last_name)
from employees
where last_name like 'E%e'
group by last_name;
-- five last names that start and end with e

-- Q4
select first_name, last_name
from employees
where last_name like 'E%e'
group by first_name, last_name;

-- Q5
select distinct last_name
from employees
where last_name like '%q%'
and last_name not like '%qu%';
-- unique names are Chleq, Lindqvist, and Qiwen
-- using group by would be this
select last_name
from employees
where last_name like '%q%'
and last_name not like '%qu%'
group by last_name;
-- same results


-- Q6
select last_name, count(last_name)
from employees
where last_name like '%q%'
and last_name not like '%qu%'
group by last_name;
-- Chleq - 189, Lindqvist - 190, Qiwen - 168

-- Q7
SELECT 
    COUNT(*) AS count, gender
FROM
    employees
WHERE
    (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya')
group by gender;
-- Male count = 441 and Female Count = 268

-- Q8
SELECT count(*) as amount_of_username,
    LOWER(CONCAT(SUBSTR(first_name, 1, 1),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    DATE_FORMAT(birth_date, '%m'),
                    SUBSTR(birth_date, 3, 2))) AS username
FROM
    employees
group by username
having amount_of_username > 1;
    -- yes there are duplicates
    
  -- bonus 8
  
  
SELECT 
    SUM(duplicate_count.amount_of_username)
FROM
    (SELECT 
        COUNT(*) AS amount_of_username,
            LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', DATE_FORMAT(birth_date, '%m'), SUBSTR(birth_date, 3, 2))) AS username
    FROM
        employees
    GROUP BY username
    HAVING amount_of_username > 1) AS duplicate_count;

-- 27402 duplicate usernames



-- ---  Bonus Q&A

-- Q9.1
select emp_no, Avg(salary)
from salaries
group by emp_no;

-- Q9.2
select emp_no, to_date
from dept_manager
where to_date > now();

-- Q9.3
select emp_no, count(salary)
from salaries
group by emp_no;

-- Q9.4
select emp_no, max(salary)
from salaries
group by emp_no;

-- Q 9.5
select emp_no, min(salary)
from salaries
group by emp_no;

-- Q9.6
select emp_no, std(salary)
from salaries
group by emp_no;

-- Q9.7
select emp_no, max(salary)
from salaries
where salary > 150000
group by emp_no;

-- Q9.8
select emp_no, max(salary)
from salaries
where salary < 90000 and salary > 8000
group by emp_no;
