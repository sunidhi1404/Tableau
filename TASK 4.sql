/*
Task 4: To create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. This range be defined by two values the user can insert when calling the procedure.
*/

DELIMITER $$
CREATE PROCEDURE average_salary_procedure(IN p_min_range FLOAT, IN p_max_range FLOAT)
BEGIN
SELECT AVG(s.salary) AS avg_salary, d.dept_name, e.gender
FROM t_salaries s
JOIN t_employees e ON e.emp_no = s.emp_no
JOIN t_dept_emp de ON s.emp_no = de.emp_no
JOIN t_departments d ON d.dept_no = de.dept_no
WHERE s.salary BETWEEN p_min_range AND p_max_range
GROUP BY d.dept_no, e.gender
ORDER BY d.dept_no;
END $$
DELIMITER ;

call employees_mod.average_salary_procedure(50000, 90000);