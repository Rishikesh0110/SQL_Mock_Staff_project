/********** Filterig, Join and Aggregration ************/

/* how many people are earning above/below the average salary of his/her department ? */
use project;
-- Finding who get above the average salary in his/her department
SELECT 
    s.department,
    COUNT(s.salary) AS Total_peoples_who_get_above_avg_salary_in_department
FROM
    staff s
WHERE
    s.salary > (SELECT 
            AVG(s2.salary)
        FROM
            staff s2
        WHERE
            s2.department = s.department)
GROUP BY 1
ORDER BY 1;

/* Observations: we can see from abobe that in each department similer kind of number of peoples who 
in each department who getting above than avg. salary   The range of peoples ar only 20 to 30 in each department*/

-- Checking HOW MANY PEOPLES ARE GETTING SLARY LOWER THAN AVG IN EACH DEPARTMENT
SELECT 
    s.department, count(s.salary) as Total_peoples_who_get_lower_than_avg_salary_in_department
FROM
    staff s
WHERE
    s.salary < (SELECT 
            avg(s2.salary)
        FROM
            staff s2
        WHERE
            s2.department = s.department)
            group by 1
            order by 1 ;
	/* Observation : We can see than in each department there are 15 to 28 peoples
    who are getting lower salary than the avg salary*/
    
/* who earn the most in the company?*/ 
select * from staff;
SELECT 
    last_name, department, salary
FROM
    staff
WHERE
    salary = (SELECT 
            MAX(salary)
        FROM
            staff);
/* Observations: The person whos last name is stanley has highest salary in the company 
who is working in Grocery department */

/* who earn the most in his/her own department */
SELECT 
    s.department, s.last_name, s.salary
FROM
    staff s
WHERE
    s.salary = (SELECT 
            MAX(s2.salary)
        FROM
            staff s2
        WHERE
            s2.department = s.department)
ORDER BY 3 DESC;
/* Observations: We can conclude that in ecah department similer kind of max_salary 
which is distributed to the employees who ar earning highest in department*/

/* How many staffs are in each company regions */
select * from staff;
select* from company_regions;
-- Need to join the data
SELECT 
    c.company_regions, COUNT(s.id) AS total_emp_in_each_regions
FROM
    staff s
        LEFT JOIN
    company_regions c ON s.region_id = c.region_id
GROUP BY 1
ORDER BY 1 DESC;
/* Observations: We can conclude that in each compamy resions number of employees more than 100
an in southwest the highest no. of emp. working which is 168 and in britis columbia only 129.