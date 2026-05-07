  
-- 36. Select employee names along with their department names.
select Employee.name , Department.name as dept from Employee inner join Department on Employee.department_id = Department.department_id ;

-- 37. Select project names along with the department names they belong to. 
select Project.name as project , Department.name as dept from Project inner join Department on  Project.department_id = Department.department_id;

-- 38. Select employee names and their corresponding project names.
select e.name, p.name from Employee e join Project p on e.department_id = p.department_id;

-- 39. Select all employees and their departments, including those without a department. 
select e.* , d.name from Employee e left outer join Department d on e.department_id = d.department_id;

-- 40. Select all departments and their employees, including departments without employees.
select d.* , e.name from Department d left outer join Employee e on d.department_id = e.department_id;

-- 41.Select employees who are not assigned to any project.
select * from Employee where department_id not in (select department_id from Project where  department_id is not null);

-- 42.Select employees and the number of projects their department is working on.
select e.name, count(p.project_id) from Employee e left join Project p on e.department_id = p.department_id group by e.emp_id;

-- 43.Select the departments that have no employees.
select d.* from Department d left join Employee e on d.department_id = e.department_id where e.emp_id is null;

-- 44.Select employee names who share the same department with 'John Doe'.
select name from Employee where department_id = (select department_id from Employee where name = 'John Doe');

-- 45.Select the department name with the highest average salary.
select d.name from Department d join Employee e on d.department_id = e.department_id group by d.department_id order by avg(e.salary) desc limit 1;

-- 46.Select the employee with the highest salary.
select * from Employee e where salary > (select avg(salary) from Employee where department_id = e.department_id);

-- 47.Select employees whose salary is above the average salary.
select * from Employee where salary > (select avg(salary) from Employee);

-- 48.Select the second highest salary from the Employee table.
 select distinct salary from Employee order by salary desc limit 1 offset 1;

-- 49.Select the department with the most employees.
select department_id
from Employee group by department_id order by COUNT(*) desc limit 1;

-- 50.Select employees who earn more than the average salary of their department.
select * from Employee e where salary > (select avg(salary) from Employee where department_id = e.department_id);

-- 51.Select the nth highest salary (for example, 3rd highest).
select distinct salary
from Employee e1
where 3 = (
    select count(distinct salary)
    from Employee e2
    where e2.salary >= e1.salary
);

-- 52.Select employees who are older than all employees in the HR department.
select *
from Employee
where age > all (
    select age
    from Employee
    where department_id = (
        select department_id
        from Department
        where name = 'HR'
    )
);

-- 53.Select departments where the average salary is greater than 55000.
select department_id
from Employee
group by department_id
having avg(salary) > 55000;

-- 54.Select employees who work in a department with at least 2 projects
select *
from Employee
where department_id in (
    select department_id
    from Project
    group by department_id
    having count(*) >= 2
);


-- 55.Select employees who were hired on the same date as 'Jane Smith'.
select *
from Employee
where hire_date = (
    select hire_date
    from Employee
    where name = 'Jane Smith'
);

-- 56.Select the total salary of employees hired in the year 2020.
select sum(salary)
from Employee
where year(hire_date) = 2020;

-- 57.Select the average salary of employees in each department, ordered by the average salary in descending order.
select department_id, avg(salary)
from Employee
group by department_id
order by avg(salary) desc;


-- 58.Select departments with more than 1 employee and an average salary greater than 55000.
select department_id
from Employee
group by department_id
having count(*) > 1
and avg(salary) > 55000;

-- 59.Select employees hired in the last 2 years, ordered by their hire date.
select *
from Employee
where hire_date >= date_sub(curdate(), interval 2 year)
order by hire_date;


-- 60.Select the total number of employees and the average salary for departments with more than 2 employees.
select department_id, count(*), avg(salary)
from Employee
group by department_id
having count(*) > 2;

-- 61.Select the name and salary of employees whose salary is above the average salary of their department.
select name, salary
from Employee e
where salary > (
    select avg(salary)
    from Employee
    where department_id = e.department_id
);

-- 62.Select the names of employees who are hired on the same date as the oldest employee in the company.
select name
from Employee
where hire_date = (
    select hire_date
    from Employee
    order by age desc
    limit 1
);

-- 63.Select the department names along with the total number of projects they are working on, ordered by the number of projects.
select d.name, count(p.project_id)
from Department d
left join Project p
on d.department_id = p.department_id
group by d.department_id
order by count(p.project_id) desc;

-- 64.Select the employee name with the highest salary in each department.
select e.name
from Employee e
where salary = (
    select max(salary)
    from Employee
    where department_id = e.department_id
);

-- 65.Select the names and salaries of employees who are older than the average age of employees in their department.
select name, salary from Employee e where age > (    select avg(age)    from Employee    where department_id = e.department_id);