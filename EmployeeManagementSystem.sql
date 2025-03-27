-- Create the database
CREATE DATABASE EmployeeManagement;

-- Use the database
USE EmployeeManagement;

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(15),
    HireDate DATE NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL
);

-- Create Projects table
CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectName NVARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(15, 2)
);

-- Create EmployeeProjects table for many-to-many relationship
CREATE TABLE EmployeeProjects (
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    Role NVARCHAR(50),
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

-- Insert some sample data
INSERT INTO Departments (DepartmentName) VALUES ('HR'), ('IT'), ('Finance'), ('Marketing');

INSERT INTO Employees (FirstName, LastName, Email, Phone, HireDate, DepartmentID, Salary) 
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '2020-01-15', 1, 50000),
('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '2021-06-20', 2, 60000),
('Alice', 'Johnson', 'alice.johnson@example.com', NULL, '2022-03-05', 3, 70000);

INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget) 
VALUES 
('Employee Portal', '2023-01-01', '2023-06-30', 100000),
('Payroll System', '2023-02-15', '2023-12-31', 150000);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, Role)
VALUES 
(1, 1, 'Team Lead'),
(2, 2, 'Developer'),
(3, 1, 'Tester');
