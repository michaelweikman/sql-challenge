--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp_id as employee_numer,
		employee.last_name,
		employee.first_name,
		department.name as department_name
	FROM department_employee
	INNER JOIN employee ON employee.id = department_employee.emp_id
	INNER JOIN department ON department.id = department_employee.dept_id;
	
--List employees who were hired in 1986.
SELECT id as employee_number, 
		last_name, 
		first_name,
		gender,
		salary
	FROM employee
	INNER JOIN salary ON salary.emp_id = employee.id
	WHERE EXTRACT(YEAR FROM employee.hire_date) = 1986;
	
--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_id as department_number, 
		department.name as department_name,
		emp_id as employee_number,
		employee.last_name, 
		employee.first_name, 
		employee.hire_date, 
		to_date as end_date
	FROM department_manager
	INNER JOIN department ON department.id = department_manager.dept_id
	INNER JOIN employee ON employee.id = department_manager.emp_id;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp_id as employee_numer,
		employee.last_name,
		employee.first_name,
		department.name as department_name
	FROM department_employee
	INNER JOIN employee ON employee.id = department_employee.emp_id
	INNER JOIN department ON department.id = department_employee.dept_id;
	
--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT id, birth_date, first_name, last_name, gender, hire_date
	FROM employee
	WHERE LOWER(first_name) = 'hercules' AND LOWER(last_name) LIKE 'b%';
	
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_id as employee_number,
		employee.last_name,
		employee.first_name,
		department.name as department_name
	FROM department_employee
	INNER JOIN employee ON employee.id = department_employee.emp_id
	INNER JOIN department ON department.id = department_employee.dept_id
	WHERE department_employee.dept_id = 'd007';
	
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_id as employee_number,
		employee.last_name,
		employee.first_name,
		department.name as department_name
	FROM department_employee
	INNER JOIN employee ON employee.id = department_employee.emp_id
	INNER JOIN department ON department.id = department_employee.dept_id
	WHERE department.name = 'Sales' OR department.name = 'Development';
	
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
		COUNT(last_name) as frequency
	FROM employee
	GROUP BY last_name
	ORDER BY COUNT(last_name) DESC;