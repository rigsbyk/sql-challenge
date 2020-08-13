CREATE TABLE titles (

					title_id VARCHAR(30) NOT NULL,
					title VARCHAR (100) NOT NULL,
					primary key(title_id)
);

--used to test creation of tables and import
Select * from titles;

CREATE TABLE employees(

						emp_no INT NOT NULL,
						emp_title_id VARCHAR(30)NOT NULL,
						birth_date DATE NOT NULL,
						first_name VARCHAR(30) NOT NULL,
						last_name VARCHAR(30) NOT NULL,
						sex VARCHAR(10) NOT NULL,
						hire_date DATE NOT NULL,
						primary key(emp_no),
						foreign key (emp_title_id) references titles(title_id)
	
					  );
					  
--used to test creation of tables and import					  
SELECT * FROM employees;

CREATE TABLE salaries(
					
					  emp_no INT NOT NULL,
					  salary INT NOT NULL,
					  foreign key(emp_no) references employees(emp_no)
					);

--used to test creation of tables and import
SELECT * FROM salaries;

CREATE TABLE departments(

						dept_no VARCHAR(30)NOT NULL,
						dept_name VARCHAR (50) NOT NULL,
						primary key(dept_no)

						);

--used to test creation of tables and import
SElECT * FRoM departments;

CREATE TABLE dept_emp(

					 emp_no INT NOT NULL,
					 dept_no VARCHAR(30) NOT NULL,
					 foreign key(emp_no) references employees(emp_no),
					 foreign key(dept_no) references departments(dept_no),
					 primary key(emp_no,dept_no)
					);

--used to test creation of tables and import
SELECT * FROM dept_emp;


CREATE TABLE dept_manager(
	
						dept_no VARCHAR(30) NOT NULL,
						emp_no INT NOT NULL,
						foreign key(dept_no) references departments(dept_no),
					 	foreign key(emp_no) references employees(emp_no),
						primary key (dept_no, emp_no)
	
						);
						
--used to test creation of tables and import						
SELECT * FROM dept_manager;