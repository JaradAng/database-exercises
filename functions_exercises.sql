  
  -- Q2
  SELECT 
    concat(first_name, '_', last_name) as full_name
FROM
    employees
WHERE
    last_name LIKE 'E%E';
    
    -- 899 rows
    
    -- Q3
      SELECT 
    upper(concat(first_name, '_', last_name)) as full_name
FROM
    employees
WHERE
    last_name LIKE 'E%E';
    -- 899 rows
    
    -- Q4
        select round(datediff(curdate(), hire_date)/365) as tenure from employees
  where hire_date like '199%'
  and birth_date like '%-12-25';
  -- 362 rows
  
  -- Q5
  select min(salary), max(salary) from salaries where to_date > now();
  
  -- Q5
  select lower(concat(substr(first_name, 1, 1), substr(last_name, 1, 4), '_', date_format(birth_date, "%m"), substr(birth_date, 2, 2))) as username from employees; 
  
 --   select lower(concat(substr(first_name, 1, 1), substr(last_name, 1, 4), '_', substr(birth_date, 6, 2), substr(birth_date, 2, 2))) as username from employees; 

  