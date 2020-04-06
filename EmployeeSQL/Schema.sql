DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS department_employee;
DROP TABLE IF EXISTS department_manager;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

DO $$
BEGIN
    IF (SELECT to_regclass('department') ISNULL)
    THEN
        CREATE TABLE department (
			id varchar(16) Primary Key,
			name varchar(64) not null
		);
    END IF;

    IF (SELECT to_regclass('employee') ISNULL)
    THEN
        CREATE TABLE employee (
			id serial Primary Key,
			birth_date timestamp without time zone DEFAULT now() NOT Null,
			first_name varchar(64) not null,
			last_name varchar(64) not null,
			gender char not null,
			hire_date timestamp without time zone DEFAULT now() NOT Null
		);
    END IF;

	IF (SELECT to_regclass('department_manager') ISNULL)
    THEN
        CREATE TABLE department_manager (
			dept_id varchar(16) NOT Null,
			emp_id serial NOT Null,
			from_date timestamp without time zone DEFAULT now() NOT Null,
			to_date timestamp without time zone DEFAULT now() NOT Null,
			FOREIGN KEY (dept_id) REFERENCES department(id),
			FOREIGN KEY (emp_id) REFERENCES employee(id)
		);
    END IF;

	IF (SELECT to_regclass('department_employee') ISNULL)
    THEN
        CREATE TABLE department_employee (
			emp_id serial NOT Null,
			dept_id varchar(16) NOT Null,
			from_date timestamp without time zone DEFAULT now() NOT Null,
			to_date timestamp without time zone DEFAULT now() NOT Null,
			FOREIGN KEY (dept_id) REFERENCES department(id),
			FOREIGN KEY (emp_id) REFERENCES employee(id)
		);
    END IF;

	IF (SELECT to_regclass('title') ISNULL)
    THEN
        CREATE TABLE title (
			emp_id serial NOT Null,
			title varchar(64) NOT Null,
			from_date timestamp without time zone DEFAULT now() NOT Null,
			to_date timestamp without time zone DEFAULT now() NOT Null,
			FOREIGN KEY (emp_id) REFERENCES employee(id)
		);
    END IF;

	IF (SELECT to_regclass('salary') ISNULL)
    THEN
        CREATE TABLE salary (
			emp_id serial NOT Null,
			salary money NOT Null,
			from_date timestamp without time zone DEFAULT now() NOT Null,
			to_date timestamp without time zone DEFAULT now() NOT Null,
			FOREIGN KEY (emp_id) REFERENCES employee(id)
		);
    END IF;
END $$;

/* This is for me, I left in here to reference later.

COPY department
FROM '/private/tmp/TMP_CSV_CRAP/departments.csv' DELIMITER ',' CSV HEADER;

COPY employee
FROM '/private/tmp/TMP_CSV_CRAP/employees.csv' DELIMITER ',' CSV HEADER;

COPY department_employee
FROM '/private/tmp/TMP_CSV_CRAP/dept_emp.csv' DELIMITER ',' CSV HEADER;

COPY department_manager
FROM '/private/tmp/TMP_CSV_CRAP/dept_manager.csv' DELIMITER ',' CSV HEADER;

COPY salary
FROM '/private/tmp/TMP_CSV_CRAP/salaries.csv' DELIMITER ',' CSV HEADER;

COPY title
FROM '/private/tmp/TMP_CSV_CRAP/titles.csv' DELIMITER ',' CSV HEADER;
*/
