-- Create Database
CREATE DATABASE Tesla;
Use Tesla;

-- Create a table for departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert sample department data
INSERT INTO Departments ()
VALUES
	(1, 'Engineering'),
    (2, 'Sales'),
    (3, 'Marketing'),
    (4, 'Finance');

-- Create a table for employees
CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY, 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50),
    DepartmentID INT,
    Position VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert sample employee data
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Position, HireDate, Salary)
VALUES
    (1, 'John', 'Smith', 1, 'Software Engineer', '2020-01-15', 95000.00),
    (2, 'Emily', 'Brown', 2, 'Sales Manager', '2019-07-08', 80000.00),
    (3, 'David', 'Johnson', 1, 'Mechanical Engineer', '2021-03-22', 85000.00),
    (4, 'Sarah', 'Lee', 3, 'Marketing Specialist', '2022-06-10', 60000.00),
    (5, 'Michael', 'Chen', 4, 'Financial Analyst', '2022-09-05', 75000.00),
    (6, 'Emma', 'Wilson', 2, 'Sales Representative', '2023-01-30', 55000.00),
    (7, 'James', 'Davis', 1, 'Electrical Engineer', '2023-04-18', 90000.00),
    (8, 'Olivia', 'Smith', 3, 'Marketing Manager', '2023-07-02', 72000.00),
	(9, 'William', 'Miller', 1, 'Software Engineer', '2020-04-20', 92000.00),
    (10, 'Sophia', 'Johnson', 2, 'Sales Associate', '2021-08-15', 55000.00),
    (11, 'Ethan', 'Martinez', 1, 'Data Scientist', '2022-02-10', 100000.00),
    (12, 'Ava', 'Williams', 3, 'Marketing Coordinator', '2022-09-25', 48000.00),
    (13, 'Noah', 'Taylor', 4, 'Financial Manager', '2019-12-02', 110000.00),
    (14, 'Olivia', 'Brown', 2, 'Sales Representative', '2023-03-08', 59000.00),
    (15, 'Liam', 'Garcia', 1, 'Mechanical Engineer', '2023-06-18', 82000.00),
    (16, 'Emma', 'Rodriguez', 3, 'Marketing Specialist', '2022-11-05', 52000.00),
    (17, 'Mia', 'Lopez', 2, 'Sales Manager', '2021-05-30', 76000.00),
    (18, 'Jackson', 'Harris', 1, 'Software Developer', '2020-10-12', 88000.00),
    (19, 'Aiden', 'King', 4, 'Financial Analyst', '2021-03-17', 67000.00),
    (20, 'Isabella', 'Campbell', 3, 'Marketing Manager', '2019-09-10', 90000.00),
	(21, 'Elijah', 'Perez', 1, 'Software Engineer', '2022-04-15', 95000.00),
    (22, 'Charlotte', 'Smith', 2, 'Sales Associate', '2020-08-22', 52000.00),
    (23, 'Grayson', 'Johnson', 1, 'Data Analyst', '2023-01-10', 72000.00),
    (24, 'Amelia', 'Miller', 3, 'Marketing Coordinator', '2021-06-05', 48000.00),
    (25, 'Lucas', 'Taylor', 4, 'Financial Manager', '2019-11-20', 105000.00),
    (26, 'Harper', 'Garcia', 2, 'Sales Representative', '2022-03-08', 60000.00),
    (27, 'Henry', 'Brown', 1, 'Mechanical Engineer', '2023-07-18', 85000.00),
    (28, 'Luna', 'Rodriguez', 3, 'Marketing Specialist', '2022-09-05', 55000.00),
    (29, 'Alexander', 'Lopez', 2, 'Sales Manager', '2021-02-28', 78000.00),
    (30, 'Benjamin', 'Harris', 1, 'Software Developer', '2020-10-01', 89000.00),
    (31, 'Evelyn', 'King', 4, 'Financial Analyst', '2021-04-12', 68000.00),
    (32, 'Zoe', 'Campbell', 3, 'Marketing Manager', '2019-08-15', 92000.00);