--Departments Table
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
	dept_no VARCHAR(255) NOT NULL,
	dept_name VARCHAR(255) NOT NULL,
	CONSTRAINT pk_departments PRIMARY KEY (dept_no));

COPY
	departments
FROM '/private/tmp/data/departments.csv'
DELIMITER ',' CSV HEADER;
SELECT * FROM departments;
	
--Dept_emp Table
DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp (
	emp_no INTEGER,
	dept_no VARCHAR(255) NOT NULL,
	from_date DATE,
	to_date DATE);

COPY
	dept_emp
FROM '/private/tmp/data/dept_emp.csv'
DELIMITER ',' CSV HEADER;
SELECT * FROM dept_emp;

--Dept_manager Table
DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager (
	dept_no VARCHAR(255) NOT NULL,
	emp_no INTEGER,
	from_date DATE,
	to_date DATE);

COPY
	dept_manager
FROM '/private/tmp/data/dept_manager.csv'
DELIMITER ',' CSV HEADER;
SELECT * FROM dept_manager;


--Employees Table
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
	emp_no INTEGER,
	birth_date DATE,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE,
	CONSTRAINT pk_employees PRIMARY KEY (emp_no));

COPY
	employees
FROM '/private/tmp/data/employees.csv'
DELIMITER ',' CSV HEADER;
SELECT * FROM employees;

--Salaries Table
DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries (
	emp_no INTEGER,
	salary INTEGER,
	from_date DATE,
	to_date DATE);

COPY
	salaries
FROM '/private/tmp/data/salaries.csv'
DELIMITER ',' CSV HEADER;
SELECT * FROM salaries;

--Titles Table
DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles (
	emp_no INTEGER,
	title VARCHAR(255) NOT NULL,
	from_date DATE,
	to_date DATE);

COPY
	titles
FROM '/private/tmp/data/titles.csv'
DELIMITER ',' CSV HEADER;
SELECT * FROM titles;


-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;
	
-- 2. List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, dept_name, e.emp_no, last_name, first_name, from_date, to_date
FROM dept_manager dm, departments d, employees e
WHERE e.emp_no = dm.emp_no AND d.dept_no = dm.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees e, dept_emp de, departments d
WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE '%B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, first_name, last_name, dept_name
FROM employees e, dept_emp de, departments d
WHERE dept_name = 'Sales' AND e.emp_no = de.emp_no AND de.dept_no = d.dept_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, first_name, last_name, dept_name
FROM employees e, dept_emp de, departments d
WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_no AND dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;





