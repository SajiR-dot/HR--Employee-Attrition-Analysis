--Average Monthly Income of different job roles
SELECT jobrole,ROUND(avg(monthlyincome),2) as averageMonthlyIncome 
FROM employees
GROUP BY Jobrole

--Average Salary Hike
SELECT ROUND(AVG(percentsalaryhike),2) as AverageHike,jobrole 
FROM employees
GROUP BY jobrole 

--  Average age of employees who leave the company and the respective departments
SELECT department,ROUND(AVG(age),2) as average_age
FROM employees
WHERE attrition='Yes'
GROUP BY department
ORDER BY average_age


--Average years worked per department before leaving

SELECT department,AVG(yearsatcompany) as averageyearsworked
FROM employees
WHERE attrition='Yes'
GROUP BY department


--Average monthly Income

SELECT department,ROUND(AVG(monthlyincome),2) as averagemonthlyincome
FROM employees
WHERE attrition='Yes'
GROUP BY department

--Marital status and attrition

SELECT maritalstatus,count(*)
FROM employees
WHERE attrition='Yes'
GROUP BY maritalstatus

--Overtime 

SELECT Overtime,Count(attrition) AS attritionCount
FROM employees
WHERE attrition ='Yes'
GROUP BY Overtime,attrition

--Find Average Monthly Income of Employees Who Have More Experience Than the Company Average


SELECT ROUND(AVG(monthlyincome),2)AS Avg_income_of_experienced_employees
FROM employees
WHERE totalworkingyears>(SELECT avg(totalworkingyears)FROM employees);

--Average income of employees who stayed and left the company

SELECT Attrition, ROUND(AVG(MonthlyIncome),2)AS avg_income
FROM employees
GROUP BY Attrition;


--Departments with below average satisfaction

SELECT Department, AVG(JobSatisfaction) AS avg_satisfaction
FROM employees
GROUP BY Department
HAVING AVG(JobSatisfaction) < (
    SELECT AVG(JobSatisfaction) FROM employees)



--employees with below average job satisfaction based on roles

SELECT jobrole,avg(jobsatisfaction) FROM employees
GROUP BY jobrole
HAVING avg(jobsatisfaction)<(SELECT AVG(jobsatisfaction) 
FROM employees)

--Top 	3 job roles that has more attrition
	
SELECT JobRole, COUNT(*) AS attrition_count
FROM employees
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY attrition_count DESC
LIMIT 3;
--years with current manager
SELECT department,AVG(yearswithcurrmanager) as avg_years_with_manager
FROM employees
GROUP BY department
HAVING AVG(yearswithcurrmanager)>(SELECT AVG(yearswithcurrmanager) 
FROM employees)

--
