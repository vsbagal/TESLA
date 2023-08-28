/*
Easy Level:

1. Retrieve a list of all employees' first and last names. */
SELECT FirstName, LastName, Position FROM Employees;

-- 2. Count the total number of employees in each department.
SELECT COUNT(DepartmentID) AS TotalEmployees, DepartmentID FROM Employees
GROUP BY DepartmentID;

-- 3. List the names and positions of employees hired in 2022.
SELECT FirstName, LastName, Position, YEAR(HireDate) FROM Employees
WHERE  YEAR(HireDate) = 2022;

-- 4. Calculate the average salary of employees in the Sales department.
SELECT d.DepartmentName, AVG(e.Salary) FROM Departments d
JOIN Employees e ON
d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID
HAVING DepartmentName = 'Sales';

SELECT AVG(Salary) AS AverageSalary
FROM Employees
WHERE 
DepartmentID = (SELECT DepartmentID 
FROM
 Departments
WHERE
 DepartmentName = 'Sales');

-- 5. Find the highest salary among all employees.
SELECT MAX(Salary) as Maxsalary FROM employees;

SELECT * FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM employees);

-- 6. List employees who have a salary greater than $70,000.
SELECT * FROM Employees
WHERE Salary > 70000.00;

-- 7. Retrieve a distinct list of departments.
SELECT DISTINCT DepartmentID FROM Employees;

-- 8. Find the employee with the longest tenure in the company.
SELECT * FROM Employees
ORDER BY HireDate LIMIT 1;

-- 9. Calculate the average salary of all employees.
SELECT AVG(Salary) FROM Employees;

-- 10. List employees' names and salaries in ascending order of salary.
SELECT * FROM Employees
ORDER BY Salary DESC;

/* Moderate Level:

1. Determine the number of employees in each department and order them by the employee count.*/
SELECT COUNT(DepartmentID), DepartmentID FROM Employees
GROUP BY DepartmentID
ORDER BY COUNT(DepartmentID) DESC;

-- 2. Retrieve the names and hire dates of employees who joined after January 1, 2021.
SELECT * FROM Employees
WHERE HireDate > '2021-01-01';

-- 3. Calculate the total salary cost for each department.
SELECT DepartmentID, SUM(Salary) AS TotalSalary FROM Employees
GROUP BY DepartmentID
ORDER BY TotalSalary DESC;

-- 4. Find the department with the Second highest average salary.
SELECT DepartmentID, AVG(Salary) AS AvgSalary FROM Employees
GROUP BY DepartmentID
ORDER BY AvgSalary DESC LIMIT 1 OFFSET 1;

SELECT DepartmentName, AVG(Salary) AS AverageSalary
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY DepartmentName
ORDER BY AverageSalary DESC
LIMIT 1 OFFSET 1;

-- 5. List employees' names and positions who earn more than the average salary.
SELECT * FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 6. Retrieve the top 5 highest-paid employees' names, positions, and salaries.
SELECT * FROM Employees
ORDER BY Salary DESC LIMIT 5;

-- 7. Calculate the difference in years between the current date and the hire date for each employee.


-- 8. List the departments and their respective employee counts and total salaries.
SELECT DepartmentID, COUNT(DepartmentID), SUM(Salary) FROM Employees
GROUP BY DepartmentID
ORDER BY DepartmentID;

-- 9. Find the employee with the highest salary in each department.
SELECT d.DepartmentName, e.FirstName, e.LastName, e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE (e.DepartmentID, e.Salary) IN (
    SELECT DepartmentID, MAX(Salary)
    FROM Employees
    GROUP BY DepartmentID
);

SELECT
    D.DepartmentName,E.FirstName,E.LastName,E.Salary 
FROM
    (SELECT DepartmentID, MAX(Salary) AS MaxSalary FROM Employees
        GROUP BY DepartmentID) AS MaxSalaries
JOIN Employees AS E ON MaxSalaries.DepartmentID = E.DepartmentID 
AND MaxSalaries.MaxSalary = E.Salary
JOIN Departments AS D ON E.DepartmentID = D.DepartmentID;

-- 10. Determine the number of employees hired in each year and order the results by year.
SELECT COUNT(EmployeeID), YEAR(HireDate) FROM Employees
GROUP BY YEAR(HireDate)
ORDER BY YEAR(HireDate);

/*Advanced Level:

1. Calculate the median salary of employees in the Marketing department.*/
SELECT DepartmentName,
    AVG(Salary) AS MedianSalary
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE DepartmentName = 'Marketing'
GROUP BY DepartmentName;

-- 2. Retrieve the employees who have the same first name as their supervisor.
-- Limited Database

-- 3. List the employee names who have changed their position at least once.
SELECT DISTINCT E.FirstName, E.LastName
FROM Employees AS E
JOIN (
    SELECT EmployeeID, COUNT(DISTINCT Position) AS PositionChanges
    FROM Employees
    GROUP BY EmployeeID
    HAVING COUNT(DISTINCT Position) > 1
) AS PositionChangeCounts ON E.EmployeeID = PositionChangeCounts.EmployeeID;

-- 4. Calculate the salary percentile for each employee within their department.
SELECT D.DepartmentName,E.FirstName,E.LastName,E.Salary,
    PERCENT_RANK() OVER (PARTITION BY E.DepartmentID ORDER BY E.Salary) AS SalaryPercentile
	FROM Employees AS E
	JOIN Departments AS D ON E.DepartmentID = D.DepartmentID;

-- 5. Retrieve the average salary change for employees who changed positions.
SELECT E.FirstName,E.LastName,
    AVG(NewSalary - OldSalary) AS AverageSalaryChange
FROM (
    SELECT E.EmployeeID, E.FirstName, E.LastName, E.Salary AS OldSalary,
        LAG(E.Salary) OVER (PARTITION BY E.EmployeeID ORDER BY E.Position) AS NewSalary
    FROM Employees AS E
    ) AS SalaryChanges
JOIN Employees AS E ON SalaryChanges.EmployeeID = E.EmployeeID
WHERE SalaryChanges.NewSalary IS NOT NULL
GROUP BY E.FirstName, E.LastName;

-- 6. Find the most common last name among employees and how many employees share it.
SELECT LastName, COUNT(*) AS EmployeeCount FROM Employees
GROUP BY LastName
ORDER BY EmployeeCount DESC
LIMIT 1;

-- 7. Calculate the cumulative salary expense for each department over time.
SELECT D.DepartmentName, E.HireDate,
    SUM(E.Salary) OVER (PARTITION BY E.DepartmentID ORDER BY E.HireDate) AS CumulativeSalaryExpense
FROM Employees AS E
JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
ORDER BY E.DepartmentID, E.HireDate;

-- 8. List employees who have not changed positions and have been with the company for more than 3 years.
-- Datbase is limited

-- 9. Determine the employee with the highest salary relative to their department's average.
SELECT D.DepartmentName, E.FirstName, E.LastName, E.Salary,
	AVG(E.Salary) OVER (PARTITION BY E.DepartmentID) AS AverageDepartmentSalary
	FROM Employees AS E
	JOIN Departments AS D ON E.DepartmentID = D.DepartmentID	
	WHERE E.Salary = (SELECT MAX(Salary) FROM Employees WHERE DepartmentID = E.DepartmentID)
	ORDER BY E.DepartmentID;

-- 10. Calculate the standard deviation of salaries within each department.
SELECT D.DepartmentName,
    STDDEV_POP(E.Salary) AS SalaryStandardDeviation
FROM Employees AS E
JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;
