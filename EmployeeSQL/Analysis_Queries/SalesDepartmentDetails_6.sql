SELECT emp_id as employee_number,
		employee.last_name,
		employee.first_name,
		department.name as department_name
	FROM department_employee
	INNER JOIN employee ON employee.id = department_employee.emp_id
	INNER JOIN department ON department.id = department_employee.dept_id
	WHERE department_employee.dept_id = 'd007';