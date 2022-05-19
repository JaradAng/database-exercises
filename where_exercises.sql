use employees;

-- Q2
select count(*) as count 
from employees
where first_name in ('Irena', 'Vidya', 'Maya');
-- 709

-- Q3
SELECT 
    COUNT(*) AS count
FROM
    employees
WHERE
    (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya');
-- 709 again it does match


-- Q4
SELECT 
    COUNT(*) AS count
FROM
    employees
WHERE
    (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya')
        and gender = 'M';
  --  441    
  
  -- Q5
  SELECT 
    COUNT(*) AS count
FROM
    employees
WHERE
    last_name LIKE 'E%';
  -- 7330
  
  -- Q6
  select count(*) as count
  from employees
  where (last_name like 'E%' 
  or last_name like '%E');
  -- total start and end with E is 30723. 
     SELECT 
    COUNT(*) AS count
FROM
    employees
WHERE
    (last_name LIKE '%e'
    and last_name not like 'E%');
  -- both start and end with e is 23393
  
  -- Q7
 SELECT 
    COUNT(*) AS count
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%E';
  -- 899 for starting and ending with e
  
  select count(*)
  from employees
  where last_name like '%e';
  -- 24292
  
  -- Q8
  select count(*)
  from employees
  where hire_date like '199%';
  -- 135214
  
  -- Q9
  select count(*)
  from employees
  where birth_date like '%-12-25';
  -- 842
  
  -- Q10
  select count(*)
  from employees
  where hire_date like '199%'
  and birth_date like '%-12-25';
  -- 362 hired in 90s and born in xmas
  
-- Q11
select count(*)
from employees
where last_name like '%q%';
-- 1873 with a q in their last name

-- q 12
select count(*)
from employees
where last_name like '%q%'
and last_name not like '%qu%';
-- 547 with q but not qu in last name
  