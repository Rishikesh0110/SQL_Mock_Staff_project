
/* How many employees with Assistant roles */
SELECT 
    COUNT(*) AS emp_with_Assistant_Job_title
FROM
    staff
WHERE
    job_title LIKE '%%Assistant%%';
    /* Observations: 88, We can see that total number of employee who working as assistant are 88 */

/* What are those Assistant roles? */
SELECT DISTINCT
    job_title
FROM
    staff
WHERE
    job_title LIKE '%%Assistant%%'
ORDER BY Job_title;
/* Observations- We can see that there are diffrent kind of roles and those 
roles ditributed in some hierarchy such as 1,2,3,4  Basically those roles are 
Account Assistant
Administrative assitance
Assistant manager
Assistant media planner
Assitant professor
etc


/**************** Data Wrangling / Data Munging *************/


SELECT DISTINCT(department)
FROM staff
ORDER BY department;


/********* Reformatting Characters Data *********/

SELECT DISTINCT(UPPER(department))
FROM staff
ORDER BY 1;


SELECT DISTINCT(LOWER(department))
FROM staff
ORDER BY 1;


/*** Concatetation ***/
SELECT 
	last_name,
	job_title || ' - ' || department AS title_with_department 
FROM staff;

/*** Trim ***/
SELECT
	TRIM('    data sciece rocks !    ');

-- with trim is 19 characters
SELECT
	LENGTH(TRIM('    data sciece rocks !    '));
	
-- without trim is 27 characters
SELECT
	LENGTH('    data sciece rocks !    ');


