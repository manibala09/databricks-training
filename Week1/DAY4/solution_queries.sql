-- Assignment Questions
-- 1. Use ROW_NUMBER() to assign a row number to employees ordered by salary descending.
select employee_name, salary,
ROW_NUMBER() 
over(order by salary desc) as row_num
from employees;

-- 2. Use RANK() to rank employees by salary.
select employee_name, salary, 
rank()
over(order by salary desc) as rank
from employees;

-- 3. Use DENSE_RANK() to rank employees by salary.
select employee_name , salary,
dense_rank() 
over(order by salary desc) as dense_rank
from employees;

-- 4. Find the top 3 highest-paid employees using a window function.
select *
from (
    select employee_name, salary,
           row_number()
           over(order by salary desc) as rn
           from employees
) t
where rn <= 3;

-- 5. Rank employees within each department using PARTITION BY.
select employee_name, department ,salary , 
rank() 
over(partition by department 
     order by salary desc) as rank
     from employees;
                                                    
-- 6. Display the highest salary in each department using a window function.
select department, salary,
               max(salary) 
               over( partition by department) as max_salary
               from employees;
              

-- 7. Calculate the running total of order amounts ordered by order_date.
select order_id, order_date, total_amount,
sum(total_amount) over( order by order_date) as running_total
from orders;

-- 8. Calculate the cumulative sales amount for each employee.
select employee_id, order_id, total_amount, 
sum(total_amount) 
over (partition by employee_id
      order by order_date ) as cumulative_sales
      from orders;
                                                                  
-- 9. Use LAG() to show the previous order amount for each customer.
select  customer_id, order_id, total_amount,
lag( total_amount) over( partition by customer_id
                        order by order_date) as previous_order
                        from orders;

-- 10. Use LEAD() to show the next order amount for each customer.
select  customer_id, order_id, total_amount,
lead( total_amount) over( partition by customer_id
                        order by order_date) as next_order
                        from orders;

-- 11. Find the difference between the current order amount and previous order amount.
select customer_id, order_id, total_amount,
total_amount - lag( total_amount) over( partition by customer_id
                        order by order_date) as difference
                        from orders;

-- 12. Calculate a moving average of the last 3 orders.
select order_id,
       order_date,
       total_amount,
       avg(total_amount) over(
            order by order_date
            rows between 2 preceding and current row
       ) as moving_avg
from orders;

-- 13. Use NTILE(4) to divide employees into salary quartiles.
select employee_name,
       salary,
       NTILE(4) over( order by  salary desc) as quartile
from employees;

-- 14. Find the first order placed by each customer using ROW_NUMBER().
select *
from (
    select customer_id,
           order_id,
           order_date,
           row_number() over(
                partition by customer_id
                order by order_date
           ) as rn
    from orders
) t
where rn = 1;



-- 15. Find the latest order placed by each customer.
select *
from (
    select customer_id,
           order_id,
           order_date,
           row_number() over(
                partition by customer_id
                order by order_date DESC
           ) as rn
    from orders
) t
where rn = 1;

-- 16. Display employee salaries along with department average salary.
select employee_name,
       department,
       salary,
       avg(salary) over(
            partition by department
       ) as dept_avg_salary
from employees;

-- 17. Find employees earning above their department average salary.
select *
from (
    select employee_name,
           department,
           salary,
           avg(salary) over(
                partition by department
           ) as dept_avg
    from employees
) t
where salary > dept_avg;

-- 18. Use SUM() OVER(PARTITION BY department) to calculate department payroll.
select
 employee_name,
       department,
       salary,
       sum(salary) over(
            partition by department
       ) as dept_payroll
from employees;

-- 19. find the percentage contribution of each employee salary within their department.
select employee_name,
       department,
       salary,
       round(
            salary * 100.0 /
            sum(salary) over(partition by department),
            2
       ) as salary_percentage
from employees;

-- 20. use count() over() to show total number of employees alongside each row.
select employee_name,
       department,
       count(*) over() as total_employees
from employees;

-- 21. create a cte to calculate total sales per employee.
with employee_sales as (
    select employee_id,
           sum(total_amount) as total_sales
    from orders
    group by employee_id
)
select *
from employee_sales;

-- 22. use a cte to find employees whose sales exceed the company average.
with employee_sales as (
    select employee_id,
           sum(total_amount) as total_sales
    from orders
    group by employee_id
),
avg_sales as (
    select avg(total_sales) as company_avg
    from employee_sales
)
select *
from employee_sales
where total_sales > (
    select company_avg
    from avg_sales
);

-- 23. create multiple ctes to calculate customer total spending and rankings.
with customer_spending as (
    select customer_id,
           sum(total_amount) as total_spent
    from orders
    group by customer_id
),
customer_rank as (
    select customer_id,
           total_spent,
           rank() over(order by total_spent desc) as rank_num
    from customer_spending
)
select *
from customer_rank;

-- 24. write a recursive cte to generate numbers from 1 to 10.
with recursive numbers as (
    select 1 as num

    union all

    select num + 1
    from numbers
    where num < 10
)
select *
from numbers;

-- 25. use a recursive cte to display employee hierarchy data.
with recursive employee_hierarchy as (
    select employee_id,
           employee_name,
           manager_id,
           1 as level
    from employees
    where manager_id is null

    union all

    select e.employee_id,
           e.employee_name,
           e.manager_id,
           eh.level + 1
    from employees e
    join employee_hierarchy eh
    on e.manager_id = eh.employee_id
)
select *
from employee_hierarchy;

-- 26. create a cte that filters orders above the average order amount.
with avg_order as (
    select avg(total_amount) as avg_amount
    from orders
)
select *
from orders
where total_amount > (
    select avg_amount
    from avg_order
);

-- 27. use a cte and window function together to rank customers by total spending.
with customer_total as (
    select customer_id,
           sum(total_amount) as total_spent
    from orders
    group by customer_id
)
select customer_id,
       total_spent,
       dense_rank() over(
            order by total_spent desc
       ) as rank_num
from customer_total;

-- 28. find the second-highest salary in each department.
select *
from (
    select employee_name,
           department,
           salary,
           dense_rank() over(
                partition by department
                order by salary desc
           ) as rank_num
    from employees
) t
where rank_num = 2;

-- 29. display the difference between each employee salary and the department maximum salary.
select employee_name,
       department,
       salary,
       max(salary) over(
            partition by department
       ) - salary as salary_difference
from employees;

-- 30. combine ctes and window functions to find the top-performing employee in each department based on total sales.
with employee_sales as (
    select e.employee_id,
           e.employee_name,
           e.department,
           sum(o.total_amount) as total_sales
    from employees e
    join orders o
    on e.employee_id = o.employee_id
    group by e.employee_id,
             e.employee_name,
             e.department
)
select *
from (
    select employee_name,
           department,
           total_sales,
           rank() over(
                partition by department
                order by total_sales desc
           ) as rank_num
    from employee_sales
) t
where rank_num = 1;

-- bonus challenge:
-- reate a report showing monthly sales trends using: CTEs Running totals LAG() Percentage growth calculations

with monthly_sales as (
    select date_format(order_date, '%y-%m') as month,
           sum(total_amount) as monthly_total
    from orders
    group by date_format(order_date, '%y-%m')
),

sales_trend as (
    select month,
           monthly_total,

           sum(monthly_total) over(
                order by month
           ) as running_total,

           lag(monthly_total) over(
                order by month
           ) as previous_month_sales

    from monthly_sales
)

select month,
       monthly_total,
       running_total,
       previous_month_sales,

       round(
            ((monthly_total - previous_month_sales)
            / previous_month_sales) * 100,
            2
       ) as percentage_growth

from sales_trend;