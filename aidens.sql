-- 10. Show how many employees in the IT department are paid more than the manager of the Shipping department
SELECT COUNT(*) AS employee_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE LOWER(d.department_name) = 'it'
  AND e.salary > (
    SELECT MAX(m.salary)  -- Use MAX to ensure a single value is returned
    FROM employees m
    JOIN departments d2 ON m.department_id = d2.department_id
    JOIN jobs j ON m.job_id = j.job_id
    WHERE LOWER(d2.department_name) = 'shipping'
      AND LOWER(j.job_title) LIKE '%manager%'
  );


-- 11. Using "set-theory SQL", show the employee id, first name and last name of each employee who is not managed by Nancy Greenberg
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
WHERE m.first_name IS NULL OR NOT (m.first_name = 'Nancy' AND m.last_name = 'Greenberg');


-- 12. Using "set-theory SQL", show the employee id and last names of all employees paid more than 9000 or who work in Germany
(SELECT e.employee_id, e.last_name
FROM employees e
WHERE e.salary > 9000)
UNION
(SELECT e.employee_id, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name = 'Germany');


-- 13. Using "set-theory SQL", show the countries in region 4 whose names begin with the letter 'Z'
SELECT country_name
FROM countries
WHERE region_id = 4
INTERSECT
SELECT country_name
FROM countries
WHERE country_name LIKE 'Z%';