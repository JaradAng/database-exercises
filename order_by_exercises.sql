use employees;

-- Q2
select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name;
-- the first person is Irena Reutenauer -- last person is Vidya Simmen

-- ordering from descending to see who would be on bottom 
-- select first_name, last_name
-- from employees
-- where first_name in ('Irena', 'Vidya', 'Maya')
-- order by first_name desc;
-- this time the first person from descending is Vidya Awdeh

-- Q3
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya')
order by first_name, last_name;
-- first name is Irena Acton and is Vidya Zweizig



-- Q4
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya')
order by last_name, first_name;
  --  The first name is Irean Acton the last name is Maya Zyda    
  
  -- Q5
  SELECT 
    first_name, last_name, emp_no
FROM
    employees
WHERE
    last_name LIKE 'E%E'
       -- AND last_name LIKE '%E'
 order by emp_no;
  -- 899 first employee is 1002, Ramzi Erde -- last name on list is Tadahiro Erde 499648
  
  -- Q6
   SELECT 
    first_name, last_name, hire_date
FROM
    employees
WHERE
    last_name LIKE 'E%E'
       -- AND last_name LIKE '%E'
 order by hire_date desc;

  -- newest employee is Teiji Eldrige 99-11-27 and oldest is sergie erde
  
  SELECT 
    first_name, last_name, hire_date
FROM
    employees
WHERE
    last_name LIKE 'E%E'
       -- AND last_name LIKE '%E'
 order by hire_date asc;
 -- oldest emp is Sergi Erde same as ^^
  
  
  -- Q7
   select *
  from employees
  where hire_date like '199%'
  and birth_date like '%-12-25'
  order by birth_date asc, hire_date desc;
  -- Khun Bernini is oldest and hired last
  
    select *
  from employees
  where hire_date like '199%'
  and birth_date like '%-12-25'
  order by birth_date desc, hire_date asc;
  -- The youngest and hired first is Douadi Pettis
