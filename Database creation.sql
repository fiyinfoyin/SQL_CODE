--creating an employee database
CREATE DATABASE EmployeeData

--creating a table and inserting values
CREATE TABLE Employee(
Employee_ID INT IDENTITY(1,1)PRIMARY KEY,
FirstName VARCHAR(255) NOT NULL,
LastName VARCHAR(255) NOT NULL,
Job_title VARCHAR(255) NOT NULL,
Hire_date DATE
)

INSERT INTO Employee(FirstName,LastName,Job_title,Hire_date)
VALUES
('Amir','Khan','Manager','2020-01-24'),
('Will','Smith','Admin','2022-06-15'),
('Angie','Jolie','Sales','2021-09-12'),
('Lupita','Nyongo','Tech','2020-08-12'),
('John','Boyega','CEO','2020-01-01'),
('Jackie','Chan','Engineer','2021-02-27'),
('Priyanka','Chopra','Admin','2020-03-28'),
('Viola','Davis','Manager','2022-07-16'),
('Brad','Pitt','Sales','2022-09-28'),
('Antonio','Banderas','Tech','2021-05-08')

SELECT *
FROM DBO.Employee

--Create another table and insert values
CREATE TABLE Emp(
Employee_ID INT IDENTITY(1,1)PRIMARY KEY,
Phone VARCHAR(50),
Salary DECIMAL(10,2)
)

INSERT INTO Emp(Phone,Salary)
VALUES
('203490733','52000'),
('248907564','32000'),
('243765890','29500'),
('269087654','45600'),
('256768908','60000'),
('239757908','41000'),
('218907654','37000'),
('209835467','39000'),
('218903546','25000'),
('250732512','40000')

SELECT *
FROM DBO.Emp

--Join both tables
SELECT Employee.Employee_ID,
Employee.FirstName,
Employee.LastName,
Employee.Job_title,
Employee.Hire_date,
Emp.Phone,
Emp.Salary
FROM DBO.Employee
JOIN DBO.Emp
ON Employee.Employee_ID=Emp.Employee_ID