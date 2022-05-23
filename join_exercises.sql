use join_example_db;
-- join example database
-- Q1
SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;


-- Q2
select *
from users
left join roles on users.role_id = roles.id;

-- Q3
select *
from users
right join roles on users.role_id = roles.id;

-- q4
SELECT 
    r.name as rn,
   -- r.id as rid,
   -- u.role_id as roleid,
    COUNT(u.role_id) AS number_in_roles
FROM
    roles as r
         left JOIN
    users as u ON u.role_id = r.id
GROUP BY r.name;

-- -----------------------------------------


-- Using employee data base 

use employees;

-- Q2
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    dept_name
FROM
    departments AS d
        JOIN
    dept_manager AS dm ON d.dept_no = dm.dept_no
    join 
    employees as e on dm.emp_no = e.emp_no
       where
       dm.to_date > now()
order by dept_name;

-- Q3
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    dept_name
from 
  departments as d
		join
        dept_manager as dm on d.dept_no = dm.dept_no
        join
        employees as e on dm.emp_no = e.emp_no
        where 
        dm.to_date > now() and e.gender = 'F'
        order by dept_name;
 use employees;  
 
-- Q4

SELECT 
    title AS 'title', COUNT(*) as total
FROM
    titles AS t
        JOIN
    dept_emp AS de ON t.emp_no = de.emp_no
        JOIN
    departments AS d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'customer service'
        AND t.to_date > NOW()
        AND de.to_date > NOW()
GROUP BY t.title
order by t.title;
    
    -- Q5
    use employeees;
    
    SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    dept_name,
    salary as salary
from 
  departments as d
		join
        dept_manager as dm on d.dept_no = dm.dept_no
        join
        employees as e on dm.emp_no = e.emp_no
        join
        salaries as s on e.emp_no = s.emp_no
        where 
        dm.to_date > now()
        and s.to_date > now()
        order by dept_name;
 
 
 -- Q6
 
    SELECT 
    dept_name AS 'department', COUNT(*) as total -- dept_no as 'dept_num'
FROM
   departments as d
        JOIN
    dept_emp AS de ON d.dept_no = de.dept_no
       -- JOIN
    -- departments AS d ON de.dept_no = d.dept_no
        
WHERE
        -- t.to_date > NOW()
         de.to_date > NOW()
GROUP BY dept_name;
-- order by dept_no;
-- order by de.dept_name;

-- Q7
select dept_name as 'department', AVG(salary) as 'Avg Salary'
from 
departments as d
join 
dept_emp as de on d.dept_no = de.dept_no
join
salaries as s on de.emp_no = s.emp_no
where s.to_date > now()
and de.to_date > now()
group by dept_name
order by avg(salary) desc 
limit 1;


select *
from departments;
-- Q8
select e.last_name as 'Last', e.first_name as 'first', max(salary) as 'Max_Salary'
from 
departments as d
join 
dept_emp as de on d.dept_no = de.dept_no
join
salaries as s on de.emp_no = s.emp_no
join
employees as e on s.emp_no = e.emp_no
where d.dept_no = 'd001'
and s.to_date > now()
and de.to_date > now()
group by e.last_name, e.first_name
order by max(salary) desc 
limit 1;

-- Q9
select e.last_name as 'Last',e.first_name as 'First', d.dept_name as 'dept_name', s.salary as 'salary' -- max(salary) as 'Max_Salary'
from 
departments as d
join
dept_manager as dm on d.dept_no = d.dept_no
join
salaries as s on dm.emp_no = s.emp_no
join
employees as e on s.emp_no = e.emp_no
where s.to_date > now()
and dm.to_date > now()
order by s.salary desc 
limit 1;



-- Q10
select dept_name as 'department', round(AVG(salary)) as 'Avg Salary'
from 
departments as d
join 
dept_emp as de on d.dept_no = de.dept_no
join
salaries as s on de.emp_no = s.emp_no
-- where s.to_date > now()
-- and de.to_date > now()
group by dept_name
order by avg(salary) desc; 
-- limit 1;

-- Q11
-- select CONCAT(e.first_name, ' ', e.last_name) AS employee_name, concat(e.first_name, ' ', e.last_name) AS manager_name, d.dept_nam--e
-- from 
-- departments as d
 -- join 
--  dept_emp as de on d.dept_no = de.dept_no
-- join
-- dept_manager as dm on d.dept_no = dm.dept_no
-- join
-- employees as e on dm.emp_no = e.emp_no
--  where de.to_date > now()
-- and dm.to_date > now()
-- group by e.last_name
-- order by d.dept_name desc;

-- select CONCAT(e.first_name, ' ', e.last_name) AS employee_name, concat(e.first_name, ' ', e.last_name) AS manager_name, d.dept_name
select CONCAT(e.first_name, ' ', e.last_name) AS employee_name, concat(e2.first_name, ' ', e2.last_name) AS manager_name, d.dept_name
from 
employees as e
join
dept_emp as de on de.emp_no = e.emp_no
join 
departments as d on d.dept_no = de.dept_no
join
dept_manager as dm on d.dept_no = dm.dept_no
join
employees as e2 on dm.emp_no = e2.emp_no
where de.to_date > now()
and dm.to_date > now()
order by dept_name;



-- Q12
select  max(salary) as 'Max_Salary', d.dept_name as 'Department_Name'
from 
departments as d
join 
dept_emp as de on d.dept_no = de.dept_no
join
salaries as s on de.emp_no = s.emp_no
-- join
-- employees as e on s.emp_no = e.emp_no
where
s.to_date > now()
and de.to_date > now()
group by d.dept_name
order by dept_name
;

select *
from
(select  max(salary) as 'Max_Salary', d.dept_name as 'Department_Name'
from 
departments as d
join 
dept_emp as de on d.dept_no = de.dept_no
join
salaries as s on de.emp_no = s.emp_no
-- join
-- employees as e on s.emp_no = e.emp_no
where
s.to_date > now()
and de.to_date > now()
group by d.dept_name	
order by dept_name) as x;




-- CONCAT(first_name, ' ', last_name) AS employee_name
select *
from 
(select  max(salary) as 'Max_Salary', d.dept_name as 'Department_Name'
from 
departments as d
join 
dept_emp as de on d.dept_no = de.dept_no
join
salaries as s on de.emp_no = s.emp_no
-- join
-- employees as e on s.emp_no = e.emp_no
where
s.to_date > now()
and de.to_date > now()
group by d.dept_name	
order by dept_name) as x
join dept_ as e on x.dept_no = e.emp_no;



