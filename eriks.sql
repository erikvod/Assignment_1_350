-- 1. show the name of each country whose name contains the syllable ‘in’ or ‘In’
SELECT country_name
FROM countries
WHERE LOWER(country_name) LIKE '%in%';
-- 2. show how many countries there are in each region (show the region id and the count)
SELECT region_id, COUNT(*) as country_count
FROM countries
GROUP BY region_id;
-- 3.show the first and last names of each employee who is a manager (that is whose job title contains the word ‘Manager’)
SELECT e.first_name, e.last_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE Lower(j.job_title) LIKE '%manager%';
-- 4. show the first and last name of each employee managed by Nancy Greenberg
SELECT e.first_name, e.last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE m.first_name = 'Nancy' AND m.last_name = 'Greenberg';
