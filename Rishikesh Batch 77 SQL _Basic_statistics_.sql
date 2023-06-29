/************ Basic Statistics with SQL ************/

SELECT * FROM company_divisions
LIMIT 5;
/* Data intrepretation- We can see that in above table we have details abbout Departments and Divisions of the company */

SELECT * FROM company_regions
LIMIT 5;
/* From above intrepretation in yable company_regions we have details about countries */

SELECT * FROM staff
LIMIT 5;
/* Observations: We can see that in Staff table we have Names, Gender, Salary of each employees */

/* How many total employees in this company */
SELECT 
    COUNT(*)
FROM
    staff;
    -- Observations: TOTAL NUMBER OF EMPLOYESS ARE 1000 IN COMPANY.

/* What about gender distribution? */
SELECT 
    gender, COUNT(*)
FROM
    staff
GROUP BY gender;
-- Observtions:TOTAL NUMBER OF MALES ARE 504 AND TOTAL NUMBER OF FEMALES ARE 496 IN THE STAFF,

/* How many employees in each department */
SELECT 
    department, COUNT(*)
FROM
    staff
GROUP BY department
ORDER BY 1;
/*  Automotive-46, Baby-45, Beauty-53, Books-47, Clothing-53, Computers-52, Electronics-49
Games-49, Garden-47, Grocery-46, Health-46, Home-52, Industrial-47, Jewelery-46, Kids-38
 Movies-36, Music-37, Outdoors-48, Shoes-43, Sports-40, Tools-39, Toys-41 
 We can also see that Departments clothing and beauty has highest number of employee
/* How many distinct departments ? */

/* What is the highest and lowest salary of employees? */
SELECT 
    MAX(salary) AS max_sal, MIN(salary) AS min_sal
FROM
    staff;
    -- Data intrepretation: 1,49,929 IS THE HIGHEST SALARY & 40,138 IS THE MINIMUM SALARY


/* what about salary distribution by gender group? */
SELECT 
    gender,
    sum(salary) as Total_sal_for_each_gender,
    MIN(salary) AS Min_Salary,
    MAX(salary) AS Max_Salary,
    AVG(salary) AS Average_Salary
FROM
    staff
GROUP BY gender;
/* Data Interpretation: Distributed slary b/w Feamale has the total salary hold 48431202 & males hold 48900021
Avg. salary b/w both female and males are quite close 
females has slighly high in max slary range by males*/

/* How much total salary company is spending each year? */
SELECT SUM(salary)
FROM staff;
-- Data intrepretation: TOTAL SALARY SPENT BY COMPANY IN EACH YEAR IS 9,73,31,223-/

/* how spread out those salary around the average salary in each department ? */
SELECT 
    department,
    AVG(salary) AS Average_Salary,
    COUNT(*) AS total_employees
FROM
    staff
GROUP BY department
ORDER BY Average_salary DESC;
/* Data Interpretation: It seems like Outdoors deparment has the highest average salary paid  and Jewelery department with lowest */ 

/* which department has the highest salary spread out ? */
SELECT 
    department,
    MIN(salary) AS Min_salary,
    MAX(salary) AS Max_salary,
    AVG(salary) AS Average_salary,
    STDDEV_POP(salary) AS Standard_Deviation_Salary,
    COUNT(*) AS total_employees
FROM
    staff
GROUP BY department
ORDER BY 5 DESC;
/* We canculated standard daviation to check spread out salary in each department
Data Interpretation: Based on the above findings, we can see that Health department has the highest spread out. */


/* What are the deparment start with B */
SELECT DISTINCT
    department
FROM
    staff
WHERE
    department LIKE 'B%%%%%'
/* Observations: From above findins we can see that Departments which starts from B are
Baby, Books, Beauty nly three are there*/
 