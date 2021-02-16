--1.) List the following details of each employee: employee number, last name, 
--first name, sex, and salary.

Select e.emp_no,e.first_name,e.last_name,e.sex,s.salary
from employees as e 
inner join salaries as s on
e.emp_no = s.emp_no;

--2.) List first name, last name, and hire date for employees 
--who were hired in 1986.

Select first_name, last_name, hire_date
from employees 
where date_part('year',hire_date) = 1986;

--3.)List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.

--* I added emp_title_id to make sure I was pulling all managers

select d.dept_no, d.dept_name, e.emp_no, e.first_name,e.last_name,e.emp_title_id
from departments as d
inner join dept_manager as dm on
d.dept_no = dm.dept_no 
inner join employees as e on 
dm.emp_no = e.emp_no;

--4.)List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

Select e.emp_no,e.first_name,e.last_name,d.dept_name
From employees as e 
Inner Join dept_emp as de
On e.emp_no = de.emp_no 
Inner Join departments as d 
On de.dept_no = d.dept_no;

--5.)List first name, last name, and sex for employees whose first name is
--"Hercules" and last names begin with "B."
Select first_name,last_name, sex from employees
where first_name = 'Hercules' AND last_name ILIKE 'B%';

--6.)List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

Select e.emp_no,e.first_name,e.last_name,d.dept_name
From employees as e inner join 
dept_emp as de On
e.emp_no = de.emp_no
inner join departments as d
On de.dept_no = d.dept_no
Where d.dept_name = 'Sales';

--7.)List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

Select e.emp_no,e.first_name,e.last_name,d.dept_name
From employees as e inner join 
dept_emp as de On
e.emp_no = de.emp_no
inner join departments as d
On de.dept_no = d.dept_no
Where (d.dept_name = 'Sales') OR (d.dept_name='Development');

--8.)In descending order, list the frequency count of employee last names, i.e.,
--how many employees share each last name.

Select last_name,count(last_name)as "Last Name Count"
From employees
Group by last_name
Order by last_name desc;
------------------------------------------------------------------
--POST SUBMISSION IN 2021 to continue to practice--

--Find all employees who made over $100,000 in salary in DESC order

select employees.emp_no, employees.first_name, employees.last_name,
salaries.salary from employees inner join salaries on 
employees.emp_no = salaries.emp_no where salaries.salary > 100000 ORDER BY 
salaries DESC;

--Find the employee who made the highest salary using a subquery

select e.emp_no,e.first_name,e.last_name,e.hire_date,s.salary from employees as e
inner join salaries s ON e.emp_no = s.emp_no
where s.salary = (select max(salary) from salaries);

--Find the dept_no and dept_name for the highest paid salary query from above
select e.first_name, e.last_name,de.dept_no, d.dept_name
from employees as e inner join dept_emp de on de.emp_no = e.emp_no
inner join departments d on d.dept_no = de.dept_no where e.emp_no = 205000;

--Combining the two queries above to continue to practice multiple joins
select e.emp_no,e.first_name,e.last_name,e.hire_date,s.salary,de.dept_no, d.dept_name from employees as e
inner join salaries s ON e.emp_no = s.emp_no inner join dept_emp 
de ON de.emp_no = s.emp_no inner join departments d on d.dept_no = de.dept_no
where s.salary = (select max(salary) from salaries);

