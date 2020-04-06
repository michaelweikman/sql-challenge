SELECT id, birth_date, first_name, last_name, gender, hire_date
	FROM employee
	WHERE LOWER(first_name) = 'hercules' AND LOWER(last_name) LIKE 'b%';