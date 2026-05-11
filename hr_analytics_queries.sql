use hr_analytics;
select count(*)
from employees_data;
select count(*) as total_records 
from employees_data;
select * from employees_data
limit 10;
describe employees_data;
ALTER TABLE employees_data
MODIFY Hire_Date DATE;
SELECT Hire_Date
From employees_data
Limit 20;
Describe employees_data;
select
count(*) as total_rows,
count(distinct Employee_ID) as 
unique_employees,
Min(Hire_Date) as 
earliest_hire_date,
Max(Hire_Date) as latest_hire_date,
Min(Age) as min_age,
Max(Age) as max_age,
Min(Monthly_salary) as min_salary,
Max(Monthly_salary) as max_salary
From employees_data;
Select Department,
count(*) as total_employees
from employees_data
group by department
order by total_employees desc;
select job_title,
round(AVG(monthly_salary),2) as avg_salary
From employees_data
group by Job_title
order by avg_salary desc;
select department,
count(*) as total_employees,
sum(case when resigned='Yes'
then 1 else 0 end) as resigned_count,
round(
sum(case when resigned='Yes' then 1 else 0 end)
* 100.0/count(*),
2) as attrition_rate
from employees_data
group by department
order by attrition_rate desc;
select Employee_ID,
Department,
Job_title,
Monthly_salary
from employees_data
order by Monthly_salary desc
limit 10;
Select Employee_ID,
Job_title,
Performance_Score,
Monthly_salary
from employees_data
where performance_score>= 4
and monthly_salary < 5000
Order by performance_score desc;
select department,
round(avg(employee_satisfaction_score),2)
as avg_satisfaction
from employees_data
group by department
order by avg_satisfaction desc;
select department,
round(avg(overtime_hours),2) as 
avg_overtime
from employees_data
group by department
order by avg_overtime desc;
select year(Hire_date) as hire_year,
count(*) as employees_hired 
from employees_data
group by year(hire_date)
order by hire_year;
select employee_id,
department,
monthly_salary,
rank() over(
partition by department
order by monthly_salary
desc 
) as salary_rank
from employees_data;
select Employee_ID,
Department,
Monthly_Salary
From employees_data e
where Monthly_Salary >
( 
select avg(Monthly_Salary)
From employees_data
where Department = e.Department
);
select Employee_ID,
Department,
Monthly_salary,
Rank() over(
Partition by Department
order by monthly_salary
desc
) as salary_rank
from employees_data
limit 100;
with salary_cte as 
(
select department,
AVG(MONTHLY_SALARY) AS 
AVG_SALARY
FROM EMPLOYEES_DATA
GROUP BY DEPARTMENT
)
SELECT *
FROM SALARY_CTE;
SELECT DEPARTMENT,
COUNT(*) AS RESIGNED_EMPLOYEES
FROM EMPLOYEES_DATA
WHERE RESIGNED='YES'
GROUP BY DEPARTMENT
ORDER BY RESIGNED_EMPLOYEES DESC
LIMIT 1;
SELECT
DEPARTMENT,
COUNT(*) AS Total_employees,
sum(case when resigned='Yes' then 1 else 0 end) as 
resigned_employees, 
round((sum(case when resigned='Yes' then 1 else 0 end) *100.0)/
count(*),2
)
as attrition_rate
from employees_data
group by department
order by attrition_rate desc;
select 
employee_ID,
Department,
Job_Title,
Monthly_Salary
From employees_data
Order by Monthly_Salary desc
limit 10;
select 
education_level,
round(avg(monthly_salary),2) as 
avg_salary
from employees_data
group by education_level
order by avg_salary desc;
select
department,
round(avg(overtime_hours),2) as 
avg_overtime 
from employees_data
group by department
order by avg_overtime desc;
select 
employee_ID,
Department,
Performance_Score,
Monthly_salary
From employees_data
where performance_score>= 4
and monthly_salary<
(
select avg(monthly_salary)
from employees_data
)
order by performance_score desc;
select 
department,
round(avg(employee_satisfaction_score)
,2) as avg_satisfaction
from employees_data
group by department
order by avg_satisfaction desc;
select 
employee_ID,
department,
Years_At_Company
from employees_data
order by Years_at_company desc
limit 10;
select employee_id,
department,
monthly_salary,
rank() over(
order by monthly_salary desc
) as salary_rank
from employees_data;
select 
employee_id,
department,
monthly_salary,
dense_rank () over(
partition by department
order by monthly_salary desc
) as dept_salary_rank
from employees_data;
select 
employee_id,
monthly_salary,
sum(monthly_salary)
over(order by employee_id)
as running_salary_total
from employees_data;
select 
employee_id,
department,
monthly_salary
from employees_data e
where monthly_salary > (
select avg(monthly_salary)
from employees_data
where department= e.department);
with avg_salary_cte AS
(
select 
department,
avg(monthly_salary) as avg_salary
from employees_data
group by department
)
select
e.employee_id,
e.department,
e.monthly_salary,
a.avg_salary
from employees_data e
join avg_salary_cte a 
on e.department = a.department;
select
employee_ID,
Department,
Monthly_salary,
rank() over(
partition by department
order by monthly_salary desc
) as salary_rank
from employees_data
limit 20;
select *
from 
(
select
employee_ID,
Department,
Monthly_Salary,
Dense_Rank() over(
partition by department
order by monthly_salary desc
) as salary_rank
from employees_data
) ranked
where salary_rank = 2;
select 
employee_id,
department,
monthly_salary
from employees_data
where monthly_salary>
(
select avg(monthly_salary)
from employees_data
);
select
department,
round(avg(employee_satisfaction_score)
,2)
as avg_satisfaction
from employees_data
group by department
order by avg_satisfaction desc
limit 1;
select
year(hire_date) as hire_year,
count(*) as total_hires
from employees_data
group by year(Hire_date)
order by Hire_year;
select 
employee_Id,
department,
overtime_hours
from employees_data
order by overtime_hours desc
limit 10;
select employee_id,
monthly_salary,
sum(monthly_salary)
over(order by employee_ID)
as running_total
from employees_data
limit 20;
select *
from
(
select
employee_id,
department,
performance_score,
rank() over(
partition by department
order by performance_score desc
) as performance_rank
from employees_data
) ranked
where performance_rank =1;
create view high_performers as 
select
employee_ID,
department,
performance_score,
monthly_salary
from employees_data
where performance_score>=4;
select *
from high_performers
limit 20;