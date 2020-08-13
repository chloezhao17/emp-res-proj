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




