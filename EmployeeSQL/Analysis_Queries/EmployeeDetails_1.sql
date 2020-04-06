SELECT id as employee_number, last_name, first_name, gender, salary
	FROM employee
	INNER JOIN salary ON salary.emp_id = employee.id;
