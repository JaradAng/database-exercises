use employees;

-- Q2
select distinct last_name
from employees
order by last_name desc
limit 10;
-- 'Zykh', 'Zyda', 'Zwicker', 'Zweizig', 'Zumaque', 'Zultner', 'Zucker', 'Zuberek', 'Zschoche', 'Zongker'


-- Q3
    select *
  from employees
  where hire_date like '199%'
  and birth_date like '%-12-25'
  order by hire_date
  limit 5;
-- A, Cappello - U, Mandell - B, Schreiter -B, Kushner - P, Stroustrup

-- Q4
    select *
  from employees
  where hire_date like '199%'
  and birth_date like '%-12-25'
  order by hire_date
limit 5 offset 50;
-- I offset by 50 because the 10th page would start at 50 