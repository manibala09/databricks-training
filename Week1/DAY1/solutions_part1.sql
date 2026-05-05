-- 1.Select all columns from the Employee table
select * from Employee;

-- 2.Select only the name and salary columns from the Employee table.
select name, salary from Employee;

-- 3.Select employees who are older than 30.
select * from Employee where age>30;

-- 4.Select the names of all departments.
select name from Department;

-- 5.Select employees who work in the IT department.
select * from Employee where department_id = (select department_id from Department where name = 'IT');

-- 6.Select employees whose names start with 'J'.
select * from Employee where name like 'J%';

-- 7.Select employees whose names end with 'e'.
select * from Employee where name like '%e';

-- 8.Select employees whose names contain 'a'.
select * from Employee where name like '%a%';

-- 9.Select employees whose names are exactly 9 characters long.
select * from Employee where name like '_________';

-- 10.Select employees whose names have 'o' as the second character.
select * from Employee where name like '_o%';

-- 11.Select employees hired in the year 2020.
select * from Employee where year(hire_date) = 2020;

-- 12.Select employees hired in January of any year.
select * from Employee where month(hire_date) = 1;

-- 13.Select employees hired before 2019.
select * from Employee where year(hire_date)<2019;

-- 14.Select employees hired on or after March 1, 2021.
select * from Employee where hire_date >= '2021-03-01';

-- 15.Select employees hired in the last 2 years.
select * from Employee where hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 16.Select the total salary of all employees.
select sum(salary) as total_salary from Employee;

-- 17.Select the average salary of employees.
select avg(salary) as average_salary from Employee;

-- 18.Select the minimum salary in the Employee table.
select min(salary) as min_salary from Employee;

-- 19.Select the number of employees in each department.
select name, (select count(*) from Employee where Employee.department_id = Department.department_id ) as total_employees from Department;

-- 20.Select the average salary of employees in each department.
select name , (select avg(salary) from Employee where Employee.department_id = Department.department_id) as average_salary from Department;

-- 21.Select the total salary for each department.
select department_id, sum(salary) from Employee group by department_id;

-- 22.Select the average age of employees in each department.
select department_id, avg(age) from Employee group by department_id;

-- 23.Select the number of employees hired in each year.
select year(hire_date), count(*) from Employee group by YEAR(hire_date);

-- 24.Select the highest salary in each department.
select department_id, max(salary) from Employee group by department_id;

-- 25.Select the department with the highest average salary.
select department_id from Employee group by department_id order by avg(salary) desc  LIMIT 1;

-- 26.Select departments with more than 2 employees.
select department_id from Employee group by department_id having count(*) > 2;
    
-- 27.Select departments with an average salary greater than 55000.
select department_id from Employee group by department_id having avg(salary) > 55000;

-- 28.Select years with more than 1 employee hired.
select year(hire_date) from Employee group by year(hire_date) having count(*) > 1;

-- 29.Select departments with a total salary expense less than 100000.
select department_id from Employee group by department_id having sum(salary) < 100000;

-- 30.Select departments with the maximum salary above 75000.
select department_id from Employee group by department_id having max(salary)>75000;

-- 31.Select all employees ordered by their salary in ascending order.
select * from Employee order by salary asc;

-- 32.Select all employees ordered by their age in descending order.
select * from Employee order by age desc;

-- 33.Select all employees ordered by their hire date in ascending order.
select * from Employee order by hire_date asc;

-- 34.Select employees ordered by their department and then by their salary.
select * from Employee order by department_id, salary;

-- 35.Select departments ordered by the total salary of their employees.
select d.name from Department d join Employee e on d.department_id = e.department_id group by d.department_id order by sum(e.salary);
  