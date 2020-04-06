SELECT last_name, COUNT(last_name) as frequency
	FROM employee
	GROUP BY last_name
	ORDER BY COUNT(last_name) DESC;