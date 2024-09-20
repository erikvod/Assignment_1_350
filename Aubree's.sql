-- 5. Show the first and last name of each employee who is paid more than Luis Popp but less than Alexander Hunold
SELECT first_name, last_name
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Luis' AND last_name = 'Popp')
  AND salary < (SELECT salary FROM employees WHERE first_name = 'Alexander' AND last_name = 'Hunold');


-- 6. Show the average salary of the employees working in Germany
SELECT AVG(e.salary) as avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name = 'Germany';


-- 7. Show the average salary of each department that has at least 8 employees (show the department id)
SELECT department_id, AVG(salary) as avg_salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 8;


-- 8. Show the (actual) minimum and maximum salary for programmers
SELECT MIN(salary) as min_salary, MAX(salary) as max_salary
FROM employees
WHERE job_id = (SELECT job_id FROM jobs WHERE LOWER(job_title) = 'programmer');


-- 9. Show the total salary paid to all employees in the Finance department
SELECT SUM(e.salary) as total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE LOWER(d.department_name) = 'finance';