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